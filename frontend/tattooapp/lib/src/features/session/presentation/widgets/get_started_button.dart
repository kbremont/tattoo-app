import 'package:flutter/foundation.dart';
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
        // check if debug mode is enabled route to dev login
        if (kDebugMode) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil('/dev-login', (route) => false);
        } else {
          final destination = await coordinator.startSession();

          if (!context.mounted) return;

          switch (destination) {
            case SessionDestination.profile:
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil('/profile', (route) => false);
              break;
            case SessionDestination.onboarding:
              Navigator.of(
                context,
              ).pushReplacementNamed('/user/type-selection');
              break;
          }
        }
      },
      child: const Text('Get Started'),
    );
  }
}
