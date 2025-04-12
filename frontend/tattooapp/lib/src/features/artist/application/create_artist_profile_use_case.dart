import 'package:tattooapp/src/features/artist/data/artist_profiles_repository.dart';
import 'package:tattooapp/src/features/artist/domain/artist_profile.dart';

class CreateArtistProfileUseCase {
  final ArtistProfilesRepository _artistProfilesRepository;

  CreateArtistProfileUseCase(this._artistProfilesRepository);

  Future<void> execute({
    required String accessToken,
    required ArtistProfile artist,
  }) async {
    try {
      await _artistProfilesRepository.createArtistProfile(
        accessToken: accessToken,
        artistProfile: artist.toProto(),
      );
    } catch (e) {
      throw Exception('Failed to create artist profile: $e');
    }
  }
}
