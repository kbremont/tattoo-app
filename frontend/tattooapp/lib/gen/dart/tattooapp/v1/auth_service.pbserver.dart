//
//  Generated code. Do not modify.
//  source: tattooapp/v1/auth_service.proto
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

import 'auth_service.pb.dart' as $1;
import 'auth_service.pbjson.dart';

export 'auth_service.pb.dart';

abstract class AuthServiceBase extends $pb.GeneratedService {
  $async.Future<$1.SignUpResponse> signUp($pb.ServerContext ctx, $1.SignUpRequest request);
  $async.Future<$1.LogInResponse> logIn($pb.ServerContext ctx, $1.LogInRequest request);
  $async.Future<$1.RefreshTokenResponse> refreshToken($pb.ServerContext ctx, $1.RefreshTokenRequest request);
  $async.Future<$1.LogOutResponse> logOut($pb.ServerContext ctx, $1.LogOutRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'SignUp': return $1.SignUpRequest();
      case 'LogIn': return $1.LogInRequest();
      case 'RefreshToken': return $1.RefreshTokenRequest();
      case 'LogOut': return $1.LogOutRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'SignUp': return this.signUp(ctx, request as $1.SignUpRequest);
      case 'LogIn': return this.logIn(ctx, request as $1.LogInRequest);
      case 'RefreshToken': return this.refreshToken(ctx, request as $1.RefreshTokenRequest);
      case 'LogOut': return this.logOut(ctx, request as $1.LogOutRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => AuthServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => AuthServiceBase$messageJson;
}

