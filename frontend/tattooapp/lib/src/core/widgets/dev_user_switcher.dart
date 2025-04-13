import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/session/session_providers.dart';
import 'package:tattooapp/src/features/user/user_providers.dart';
import 'package:tattooapp/src/features/user/domain/user.dart';

class DevUserSwitcher extends ConsumerWidget {
  const DevUserSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coordinator = ref.watch(sessionCoordinatorProvider);
    final user = ref.watch(userProvider).value;

    if (!kDebugMode) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text('Switch Dev User', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            if (user?.role == UserRole.client) ...[
              ElevatedButton(
                onPressed: () async {
                  await coordinator.startDevSession("artist");

                  if (!context.mounted) return;
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/main',
                    (route) => false,
                    arguments: 2,
                  );
                },
                child: const Text('Artist'),
              ),
            ] else if (user?.role == UserRole.artist) ...[
              ElevatedButton(
                onPressed: () async {
                  await coordinator.startDevSession("client");

                  if (!context.mounted) return;
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/main',
                    (route) => false,
                    arguments: 2,
                  );
                },
                child: const Text('Client'),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
