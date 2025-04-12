import 'package:tattooapp/src/features/artist/data/artist_profiles_repository.dart';
import 'package:tattooapp/src/features/artist/domain/artist_profile.dart';

class GetArtistProfileUseCase {
  final ArtistProfilesRepository _artistProfilesRepository;

  GetArtistProfileUseCase(this._artistProfilesRepository);

  Future<ArtistProfile> execute({
    required String accessToken,
    required String userId,
  }) async {
    try {
      final protoArtistProfile = await _artistProfilesRepository
          .getArtistProfile(accessToken: accessToken, userId: userId);

      return ArtistProfile.fromProto(protoArtistProfile);
    } catch (e) {
      throw Exception('Failed to get artist profile: $e');
    }
  }
}
