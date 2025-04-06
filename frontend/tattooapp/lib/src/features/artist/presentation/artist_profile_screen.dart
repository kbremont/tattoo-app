import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/artist/artist_providers.dart';
import 'package:tattooapp/src/features/auth/presentation/widgets/logout_button.dart';
import 'package:tattooapp/src/core/widgets/editable_avatar.dart';
import 'package:tattooapp/src/core/utils/cloudinary_upload.dart';
import 'package:tattooapp/src/features/user/user_providers.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';

class ArtistProfileScreen extends ConsumerStatefulWidget {
  const ArtistProfileScreen({super.key});

  @override
  ConsumerState<ArtistProfileScreen> createState() =>
      _ArtistProfileScreenState();
}

class _ArtistProfileScreenState extends ConsumerState<ArtistProfileScreen> {
  File? _selectedAvatar;

  @override
  Widget build(BuildContext context) {
    final artistProfileAsync = ref.watch(artistProfileProvider);
    final userAsync = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Artist Profile')),
      body: artistProfileAsync.when(
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
                            avatarUrl: avatarUrl,
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
                        if (profile.tattooShop != null &&
                            profile.tattooShop!.isNotEmpty) ...[
                          const SizedBox(width: 16),
                          const Icon(Icons.storefront_outlined),
                          const SizedBox(width: 8),
                          Text(profile.tattooShop!),
                        ],
                      ],
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'About Me',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        profile.bio ?? 'No bio yet.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
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
