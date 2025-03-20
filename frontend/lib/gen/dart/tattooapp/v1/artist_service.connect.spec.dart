//
//  Generated code. Do not modify.
//  source: tattooapp/v1/artist_service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "artist_service.pb.dart" as tattooappv1artist_service;

abstract final class ArtistService {
  /// Fully-qualified name of the ArtistService service.
  static const name = 'tattooapp.v1.ArtistService';

  static const linkInstagramAccount = connect.Spec(
    '/$name/LinkInstagramAccount',
    connect.StreamType.unary,
    tattooappv1artist_service.LinkInstagramAccountRequest.new,
    tattooappv1artist_service.LinkInstagramAccountResponse.new,
  );

  static const createArtist = connect.Spec(
    '/$name/CreateArtist',
    connect.StreamType.unary,
    tattooappv1artist_service.CreateArtistRequest.new,
    tattooappv1artist_service.CreateArtistResponse.new,
  );
}
