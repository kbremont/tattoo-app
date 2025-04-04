import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/user/domain/user.dart';
import 'package:tattooapp/src/features/user/user_providers.dart';

class UserTypeSelectionScreen extends ConsumerWidget {
  const UserTypeSelectionScreen({super.key});

  void _onSelectRole(BuildContext context, WidgetRef ref, UserRole role) {
    ref.read(newUserStateProvider.notifier).updateRole(role);
    Navigator.of(context).pushNamed('/user/name-entry');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Who are you?')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 48),
            Text(
              'Let’s get to know you.',
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.brush),
              label: const Text("I'm an Artist"),
              onPressed: () => _onSelectRole(context, ref, UserRole.artist),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.search),
              label: const Text("I'm Looking for a Tattoo"),
              onPressed: () => _onSelectRole(context, ref, UserRole.client),
            ),
          ],
        ),
      ),
    );
  }
}
