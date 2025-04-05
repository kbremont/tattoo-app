import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/artist/data/artist_profiles_repository.dart';
import 'package:tattooapp/src/features/artist/domain/artist_profile.dart';
import 'package:tattooapp/gen/dart/tattooapp/artist/v1/artist_profile.pb.dart'
    as proto;

class GetArtistProfileUseCase {
  final ArtistProfilesRepository _artistProfilesRepository;
  final Ref _ref;

  GetArtistProfileUseCase(this._artistProfilesRepository, this._ref);

  Future<ArtistProfile> execute({
    required String accessToken,
    required String userId,
  }) async {
    try {
      final protoArtistProfile = await _artistProfilesRepository
          .getArtistProfile(accessToken: accessToken, userId: userId);

      return _mapProtoArtistProfileToArtistProfile(protoArtistProfile);
    } catch (e) {
      throw Exception('Failed to get artist profile: $e');
    }
  }
}

ArtistProfile _mapProtoArtistProfileToArtistProfile(
  proto.ArtistProfile artist,
) {
  return ArtistProfile(
    userId: artist.userId,
    bio: artist.bio,
    location: artist.location,
    tattooShop: artist.tattooShop,
  );
}
