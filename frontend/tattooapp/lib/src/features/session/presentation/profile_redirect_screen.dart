import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/user/user_providers.dart';
import 'package:tattooapp/src/features/user/domain/user.dart';

class ProfileRedirectScreen extends ConsumerWidget {
  const ProfileRedirectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider); // current user

    return user.when(
      loading:
          () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, st) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (user) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final target =
              user.role == UserRole.artist
                  ? '/profile/artist'
                  : '/profile/client';

          Navigator.of(context).pushReplacementNamed(target);
        });

        return const SizedBox.shrink(); // don't show UI
      },
    );
  }
}
