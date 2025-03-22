import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logoutUseCase = ref.watch(logoutUseCaseProvider);
    final repo = ref.watch(auth0RepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: FutureBuilder<String?>(
        future: repo.getIdToken(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'ID Token:\n${snapshot.data}',
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await logoutUseCase.execute();
                    // Redirect to login screen after logout
                  },
                  child: const Text('Log Out'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
