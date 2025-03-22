import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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

          final decoded = JwtDecoder.decode(snapshot.data!);
          final email = decoded['email'] ?? 'N/A';
          final name = decoded['name'] ?? 'N/A';
          final sub = decoded['sub'] ?? 'N/A';

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Name: $name'),
                Text('Email: $email'),
                Text('Auth0 ID: $sub'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await logoutUseCase.execute();
                    if (context.mounted) {
                      Navigator.of(context).pushReplacementNamed('/');
                    }
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
