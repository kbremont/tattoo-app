import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/client/client_providers.dart';
import 'package:tattooapp/src/features/user/user_providers.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';
import 'package:tattooapp/src/features/user/domain/user.dart';
import 'package:tattooapp/src/features/user/domain/partial_user_update.dart';
import 'package:tattooapp/src/core/widgets/editable_avatar.dart';
import 'package:tattooapp/src/core/utils/cloudinary_upload.dart';
import 'package:tattooapp/src/features/auth/presentation/widgets/logout_button.dart';
import 'package:tattooapp/src/core/widgets/dev_user_switcher.dart';

class ClientProfileScreen extends ConsumerStatefulWidget {
  const ClientProfileScreen({super.key});

  @override
  ConsumerState<ClientProfileScreen> createState() =>
      _ClientProfileScreenState();
}

class _ClientProfileScreenState extends ConsumerState<ClientProfileScreen> {
  File? _selectedAvatar;

  String _styleLabel(TattooStyles style) {
    switch (style) {
      case TattooStyles.americanTraditional:
        return 'American Traditional';
      case TattooStyles.japaneseTraditional:
        return 'Japanese Traditional';
      case TattooStyles.realism:
        return 'Realism';
      case TattooStyles.watercolor:
        return 'Watercolor';
    }
  }

  @override
  Widget build(BuildContext context) {
    final clientProfileAsync = ref.watch(clientProfileProvider);
    final userAsync = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Client Profile')),
      body: clientProfileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
        data: (profile) {
          return userAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Center(child: Text('Error loading user: $e')),
            data: (user) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EditableAvatar(
                      imageUrl: _selectedAvatar?.path ?? user.avatarUrl,
                      onImageSelected: (file) async {
                        setState(() {
                          _selectedAvatar = file;
                        });
                        final user = ref.read(userProvider).value;
                        if (user == null) return;

                        final accessToken = ref.read(accessTokenProvider);
                        if (accessToken == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please login again')),
                          );
                          return;
                        }

                        final updateUser = ref.read(updateUserUseCaseProvider);

                        try {
                          final avatarUrl = await uploadImageToCloudinary(
                            file: file,
                            cloudName: 'tattooapp',
                            uploadPreset: 'tattooapp_unsigned',
                          );

                          await updateUser.execute(
                            accessToken: accessToken,
                            userId: user.id,
                            originalUser: user,
                            updatedUser: PartialUserUpdate(
                              avatarUrl: avatarUrl,
                            ),
                          );

                          // // Optionally: refresh the userProvider manually
                          // ref.invalidate(getUserProvider(widget.userId));
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Failed to upload avatar: $e'),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${user.firstName} ${user.lastName}',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on_outlined),
                        const SizedBox(width: 8),
                        Text(profile.location ?? 'Unknown location'),
                      ],
                    ),
                    if (user.stylePreferences.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Styles',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children:
                              user.stylePreferences.map((style) {
                                return Chip(label: Text(_styleLabel(style)));
                              }).toList(),
                        ),
                      ),
                    ],
                    const DevUserSwitcher(),
                    const Spacer(),
                    const LogoutButton(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
