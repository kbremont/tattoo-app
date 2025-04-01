import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/auth/presentation/widgets/logout_button.dart';
import 'package:tattooapp/src/features/user/user_providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: userAsync.when(
        data:
            (user) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Name: ${user.firstName} ${user.lastName}'),
                  Text('Styles: ${user.stylePreferences.join(', ')}'),
                  const SizedBox(height: 20),
                  const LogoutButton(),
                ],
              ),
            ),
        loading: () => const CircularProgressIndicator(),
        error: (e, _) => Text('Error: $e'),
      ),
    );
  }
}
