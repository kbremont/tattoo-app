//
//  Generated code. Do not modify.
//  source: tattooapp/v1/artist_service.proto
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
  $async.Future<$1.LinkInstagramAccountResponse> linkInstagramAccount($pb.ServerContext ctx, $1.LinkInstagramAccountRequest request);
  $async.Future<$1.CreateArtistResponse> createArtist($pb.ServerContext ctx, $1.CreateArtistRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'LinkInstagramAccount': return $1.LinkInstagramAccountRequest();
      case 'CreateArtist': return $1.CreateArtistRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'LinkInstagramAccount': return this.linkInstagramAccount(ctx, request as $1.LinkInstagramAccountRequest);
      case 'CreateArtist': return this.createArtist(ctx, request as $1.CreateArtistRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ArtistServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => ArtistServiceBase$messageJson;
}

