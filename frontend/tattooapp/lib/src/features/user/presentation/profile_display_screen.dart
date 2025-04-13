import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/user/user_providers.dart';
import 'package:tattooapp/src/features/user/domain/user.dart';
import 'package:tattooapp/src/features/client/presentation/client_profile_screen.dart';
import 'package:tattooapp/src/features/artist/presentation/artist_profile_screen.dart';

class ProfileDisplayScreen extends ConsumerWidget {
  const ProfileDisplayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider); // current user

    return userAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
      data: (user) {
        switch (user.role) {
          case UserRole.artist:
            return const ArtistProfileScreen();
          case UserRole.client:
            return const ClientProfileScreen();
        }
      },
    );
  }
}
