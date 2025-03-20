//
//  Generated code. Do not modify.
//  source: tattooapp/v1/artist_service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "artist_service.pb.dart" as tattooappv1artist_service;
import "artist_service.connect.spec.dart" as specs;

extension type ArtistServiceClient (connect.Transport _transport) {
  Future<tattooappv1artist_service.LinkInstagramAccountResponse> linkInstagramAccount(
    tattooappv1artist_service.LinkInstagramAccountRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ArtistService.linkInstagramAccount,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<tattooappv1artist_service.CreateArtistResponse> createArtist(
    tattooappv1artist_service.CreateArtistRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ArtistService.createArtist,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
