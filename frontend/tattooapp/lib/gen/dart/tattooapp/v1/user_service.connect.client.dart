//
//  Generated code. Do not modify.
//  source: tattooapp/v1/user_service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "user_service.pb.dart" as tattooappv1user_service;
import "user_service.connect.spec.dart" as specs;

extension type UserServiceClient (connect.Transport _transport) {
  Future<tattooappv1user_service.CreateUserResponse> createUser(
    tattooappv1user_service.CreateUserRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.createUser,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<tattooappv1user_service.GetUserResponse> getUser(
    tattooappv1user_service.GetUserRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.getUser,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<tattooappv1user_service.UpdateUserResponse> updateUser(
    tattooappv1user_service.UpdateUserRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.updateUser,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<tattooappv1user_service.DeleteUserResponse> deleteUser(
    tattooappv1user_service.DeleteUserRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.deleteUser,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
