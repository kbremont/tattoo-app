import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/session/session_providers.dart';

class DevLoginScreen extends ConsumerWidget {
  const DevLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coordinator = ref.watch(sessionCoordinatorProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dev Login')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                await coordinator.startDevSession("client");

                if (!context.mounted) return;
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil('/profile', (route) => false);
              },
              child: const Text('Login as Client'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                await coordinator.startDevSession("artist");

                if (!context.mounted) return;
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil('/profile', (route) => false);
              },
              child: const Text('Login as Artist'),
            ),
          ],
        ),
      ),
    );
  }
}
