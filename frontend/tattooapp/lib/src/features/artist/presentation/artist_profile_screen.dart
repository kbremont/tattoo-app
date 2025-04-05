import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/artist/artist_providers.dart';
import 'package:tattooapp/src/features/user/user_providers.dart';

class ArtistProfileScreen extends ConsumerWidget {
  const ArtistProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artistProfileAsync = ref.watch(artistProfileProvider);
    final userAsync = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Artist Profile')),
      body: artistProfileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
        data: (profile) {
          return userAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Center(child: Text('Error loading user: $e')),
            data: (user) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.firstName} ${user.lastName}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    Text(profile.bio ?? 'No bio yet.'),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        const SizedBox(width: 8),
                        Text(profile.location ?? 'Unknown location'),
                      ],
                    ),
                    if (profile.tattooShop != null &&
                        profile.tattooShop!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          children: [
                            const Icon(Icons.storefront_outlined),
                            const SizedBox(width: 8),
                            Text(profile.tattooShop!),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
