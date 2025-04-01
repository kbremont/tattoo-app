import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/session/session_providers.dart';
import 'package:tattooapp/src/features/session/application/session_coordinator.dart';

class GetStartedButton extends ConsumerWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coordinator = ref.watch(sessionCoordinatorProvider);

    return ElevatedButton(
      onPressed: () async {
        final (destination, accessToken) = await coordinator.startSession();

        if (!context.mounted) return;

        switch (destination) {
          case SessionDestination.profile:
            Navigator.of(context).pushReplacementNamed('/profile');
            break;
          case SessionDestination.onboarding:
            Navigator.of(context).pushReplacementNamed('/user/name-entry');
            break;
        }
      },
      child: const Text('Get Started'),
    );
  }
}
