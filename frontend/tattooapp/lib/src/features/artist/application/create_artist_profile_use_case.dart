import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/gen/dart/tattooapp/artist/v1/artist_profile.pb.dart'
    as proto;
import 'package:tattooapp/src/features/artist/data/artist_profiles_repository.dart';
import 'package:tattooapp/src/features/artist/domain/artist_profile.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';

class CreateArtistProfileUseCase {
  final ArtistProfilesRepository _artistProfilesRepository;
  final Ref _ref;

  CreateArtistProfileUseCase(this._artistProfilesRepository, this._ref);

  Future<void> execute({
    required String accessToken,
    required ArtistProfile artist,
  }) async {
    final accessToken = _ref.read(accessTokenProvider);
    if (accessToken == null) {
      throw Exception('Access token is null');
    }

    try {
      await _artistProfilesRepository.createArtistProfile(
        accessToken: accessToken,
        artistProfile: _mapArtistProfileToProtoArtistProfile(artist),
      );
    } catch (e) {
      throw Exception('Failed to create artist profile: $e');
    }
  }
}

proto.ArtistProfile _mapArtistProfileToProtoArtistProfile(
  ArtistProfile artist,
) {
  return proto.ArtistProfile(
    userId: artist.userId,
    bio: artist.bio,
    location: artist.location,
    tattooShop: artist.tattooShop,
  );
}
