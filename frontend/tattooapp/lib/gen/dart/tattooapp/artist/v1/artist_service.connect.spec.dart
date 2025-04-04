//
//  Generated code. Do not modify.
//  source: tattooapp/artist/v1/artist_service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "artist_service.pb.dart" as tattooappartistv1artist_service;

abstract final class ArtistService {
  /// Fully-qualified name of the ArtistService service.
  static const name = 'tattooapp.artist.v1.ArtistService';

  static const createArtistProfile = connect.Spec(
    '/$name/CreateArtistProfile',
    connect.StreamType.unary,
    tattooappartistv1artist_service.CreateArtistProfileRequest.new,
    tattooappartistv1artist_service.CreateArtistProfileResponse.new,
  );

  static const getArtistProfile = connect.Spec(
    '/$name/GetArtistProfile',
    connect.StreamType.unary,
    tattooappartistv1artist_service.GetArtistProfileRequest.new,
    tattooappartistv1artist_service.GetArtistProfileResponse.new,
  );

  static const deleteArtistProfile = connect.Spec(
    '/$name/DeleteArtistProfile',
    connect.StreamType.unary,
    tattooappartistv1artist_service.DeleteArtistProfileRequest.new,
    tattooappartistv1artist_service.DeleteArtistProfileResponse.new,
  );
}
