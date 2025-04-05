import 'package:tattooapp/gen/dart/tattooapp/artist/v1/artist_service.connect.client.dart';
import 'package:tattooapp/gen/dart/tattooapp/artist/v1/artist_service.pb.dart';
import 'package:tattooapp/gen/dart/tattooapp/artist/v1/artist_profile.pb.dart';
import 'package:tattooapp/src/core/utils/auth_headers.dart';

class ArtistProfilesRepository {
  final ArtistServiceClient _client;

  ArtistProfilesRepository(this._client);

  Future<void> createArtistProfile({
    required String accessToken,
    required ArtistProfile artistProfile,
  }) async {
    await _client.createArtistProfile(
      CreateArtistProfileRequest(
        userId: artistProfile.userId,
        bio: artistProfile.bio,
        location: artistProfile.location,
        tattooShop: artistProfile.tattooShop,
      ),
      headers: authHeaders(accessToken),
    );
  }

  Future<ArtistProfile> getArtistProfile({
    required String accessToken,
    required String userId,
  }) async {
    final response = await _client.getArtistProfile(
      GetArtistProfileRequest(userId: userId),
      headers: authHeaders(accessToken),
    );

    return response.artistProfile;
  }
}
