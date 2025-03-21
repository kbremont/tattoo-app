//
//  Generated code. Do not modify.
//  source: tattooapp/v1/auth_service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "auth_service.pb.dart" as tattooappv1auth_service;
import "auth_service.connect.spec.dart" as specs;

extension type AuthServiceClient (connect.Transport _transport) {
  Future<tattooappv1auth_service.SignUpResponse> signUp(
    tattooappv1auth_service.SignUpRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.AuthService.signUp,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<tattooappv1auth_service.LogInResponse> logIn(
    tattooappv1auth_service.LogInRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.AuthService.logIn,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<tattooappv1auth_service.RefreshTokenResponse> refreshToken(
    tattooappv1auth_service.RefreshTokenRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.AuthService.refreshToken,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<tattooappv1auth_service.LogOutResponse> logOut(
    tattooappv1auth_service.LogOutRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.AuthService.logOut,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
