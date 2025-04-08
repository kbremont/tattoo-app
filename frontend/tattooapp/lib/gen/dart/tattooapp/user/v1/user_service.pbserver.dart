//
//  Generated code. Do not modify.
//  source: tattooapp/user/v1/user_service.proto
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

import 'user_service.pb.dart' as $4;
import 'user_service.pbjson.dart';

export 'user_service.pb.dart';

abstract class UserServiceBase extends $pb.GeneratedService {
  $async.Future<$4.CreateUserResponse> createUser($pb.ServerContext ctx, $4.CreateUserRequest request);
  $async.Future<$4.GetUserResponse> getUser($pb.ServerContext ctx, $4.GetUserRequest request);
  $async.Future<$4.UpdateUserResponse> updateUser($pb.ServerContext ctx, $4.UpdateUserRequest request);
  $async.Future<$4.DeleteUserResponse> deleteUser($pb.ServerContext ctx, $4.DeleteUserRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateUser': return $4.CreateUserRequest();
      case 'GetUser': return $4.GetUserRequest();
      case 'UpdateUser': return $4.UpdateUserRequest();
      case 'DeleteUser': return $4.DeleteUserRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateUser': return this.createUser(ctx, request as $4.CreateUserRequest);
      case 'GetUser': return this.getUser(ctx, request as $4.GetUserRequest);
      case 'UpdateUser': return this.updateUser(ctx, request as $4.UpdateUserRequest);
      case 'DeleteUser': return this.deleteUser(ctx, request as $4.DeleteUserRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => UserServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => UserServiceBase$messageJson;
}

