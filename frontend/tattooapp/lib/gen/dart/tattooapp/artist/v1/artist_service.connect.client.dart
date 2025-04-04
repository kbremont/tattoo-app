//
//  Generated code. Do not modify.
//  source: tattooapp/artist/v1/artist_service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "artist_service.pb.dart" as tattooappartistv1artist_service;
import "artist_service.connect.spec.dart" as specs;

extension type ArtistServiceClient (connect.Transport _transport) {
  Future<tattooappartistv1artist_service.CreateArtistProfileResponse> createArtistProfile(
    tattooappartistv1artist_service.CreateArtistProfileRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ArtistService.createArtistProfile,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<tattooappartistv1artist_service.GetArtistProfileResponse> getArtistProfile(
    tattooappartistv1artist_service.GetArtistProfileRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ArtistService.getArtistProfile,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<tattooappartistv1artist_service.DeleteArtistProfileResponse> deleteArtistProfile(
    tattooappartistv1artist_service.DeleteArtistProfileRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ArtistService.deleteArtistProfile,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
