import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/artist/application/new_artist_profile_state.dart';
import 'package:tattooapp/src/features/artist/data/artist_service_client.dart';
import 'package:tattooapp/src/features/artist/data/artist_profiles_repository.dart';
import 'package:tattooapp/src/features/artist/application/create_artist_profile_use_case.dart';

// ArtistServiceClient Provider
final artistServiceClientProvider = Provider((ref) {
  return ArtistServiceClientFactory.create();
});

// ArtistRepository Provider
final artistProfilesRepositoryProvider = Provider((ref) {
  final client = ref.watch(artistServiceClientProvider);
  return ArtistProfilesRepository(client);
});

final createArtistProfileUseCaseProvider = Provider((ref) {
  final repo = ref.watch(artistProfilesRepositoryProvider);
  return CreateArtistProfileUseCase(repo, ref);
});

final class NewArtistProfileStateNotifier
    extends StateNotifier<NewArtistProfileState> {
  NewArtistProfileStateNotifier() : super(const NewArtistProfileState());

  void update({
    required String bio,
    required String location,
    required String tattooShop,
  }) {
    state = state.copyWith(
      bio: bio,
      location: location,
      tattooShop: tattooShop,
    );
  }
}

final newArtistProfileStateProvider =
    StateNotifierProvider<NewArtistProfileStateNotifier, NewArtistProfileState>(
      (ref) => NewArtistProfileStateNotifier(),
    );
