//
//  Generated code. Do not modify.
//  source: tattooapp/artist/v1/artist_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'artist_service.pb.dart' as $1;
import 'artist_service.pbjson.dart';

export 'artist_service.pb.dart';

abstract class ArtistServiceBase extends $pb.GeneratedService {
  $async.Future<$1.CreateArtistProfileResponse> createArtistProfile($pb.ServerContext ctx, $1.CreateArtistProfileRequest request);
  $async.Future<$1.GetArtistProfileResponse> getArtistProfile($pb.ServerContext ctx, $1.GetArtistProfileRequest request);
  $async.Future<$1.DeleteArtistProfileResponse> deleteArtistProfile($pb.ServerContext ctx, $1.DeleteArtistProfileRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateArtistProfile': return $1.CreateArtistProfileRequest();
      case 'GetArtistProfile': return $1.GetArtistProfileRequest();
      case 'DeleteArtistProfile': return $1.DeleteArtistProfileRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateArtistProfile': return this.createArtistProfile(ctx, request as $1.CreateArtistProfileRequest);
      case 'GetArtistProfile': return this.getArtistProfile(ctx, request as $1.GetArtistProfileRequest);
      case 'DeleteArtistProfile': return this.deleteArtistProfile(ctx, request as $1.DeleteArtistProfileRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ArtistServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => ArtistServiceBase$messageJson;
}

