import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/artist/application/new_artist_profile_state.dart';
import 'package:tattooapp/src/features/artist/data/artist_service_client.dart';
import 'package:tattooapp/src/features/artist/data/artist_profiles_repository.dart';
import 'package:tattooapp/src/features/artist/application/create_artist_profile_use_case.dart';
import 'package:tattooapp/src/features/artist/application/get_artist_profile_use_case.dart';
import 'package:tattooapp/src/features/artist/domain/artist_profile.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';

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

final getArtistProfileUseCaseProvider = Provider((ref) {
  final repo = ref.watch(artistProfilesRepositoryProvider);
  return GetArtistProfileUseCase(repo, ref);
});

// provides the current artist profile
final artistProfileProvider = FutureProvider<ArtistProfile>((ref) async {
  final getArtistProfile = ref.read(getArtistProfileUseCaseProvider);
  final accessToken = ref.watch(accessTokenProvider);
  final userId = ref.watch(auth0UserIdProvider);

  if (accessToken == null) throw Exception('Missing accessToken');
  if (userId == null) throw Exception('Missing id');

  return await getArtistProfile.execute(
    accessToken: accessToken,
    userId: userId,
  );
});

// provides the given artist profile
final getArtistProfileProvider = FutureProvider.family<ArtistProfile, String>((
  ref,
  userId,
) async {
  final getArtistProfile = ref.read(getArtistProfileUseCaseProvider);
  final accessToken = ref.watch(accessTokenProvider);

  if (accessToken == null) throw Exception('Missing accessToken');

  return await getArtistProfile.execute(
    accessToken: accessToken,
    userId: userId,
  );
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
