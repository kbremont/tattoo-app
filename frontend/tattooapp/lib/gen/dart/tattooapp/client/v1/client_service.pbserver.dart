//
//  Generated code. Do not modify.
//  source: tattooapp/client/v1/client_service.proto
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

import 'client_service.pb.dart' as $3;
import 'client_service.pbjson.dart';

export 'client_service.pb.dart';

abstract class ClientServiceBase extends $pb.GeneratedService {
  $async.Future<$3.CreateClientProfileResponse> createClientProfile($pb.ServerContext ctx, $3.CreateClientProfileRequest request);
  $async.Future<$3.GetClientProfileResponse> getClientProfile($pb.ServerContext ctx, $3.GetClientProfileRequest request);
  $async.Future<$3.DeleteClientProfileResponse> deleteClientProfile($pb.ServerContext ctx, $3.DeleteClientProfileRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateClientProfile': return $3.CreateClientProfileRequest();
      case 'GetClientProfile': return $3.GetClientProfileRequest();
      case 'DeleteClientProfile': return $3.DeleteClientProfileRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateClientProfile': return this.createClientProfile(ctx, request as $3.CreateClientProfileRequest);
      case 'GetClientProfile': return this.getClientProfile(ctx, request as $3.GetClientProfileRequest);
      case 'DeleteClientProfile': return this.deleteClientProfile(ctx, request as $3.DeleteClientProfileRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ClientServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => ClientServiceBase$messageJson;
}

