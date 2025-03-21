//
//  Generated code. Do not modify.
//  source: tattooapp/v1/auth_service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "auth_service.pb.dart" as tattooappv1auth_service;

abstract final class AuthService {
  /// Fully-qualified name of the AuthService service.
  static const name = 'tattooapp.v1.AuthService';

  static const signUp = connect.Spec(
    '/$name/SignUp',
    connect.StreamType.unary,
    tattooappv1auth_service.SignUpRequest.new,
    tattooappv1auth_service.SignUpResponse.new,
  );

  static const logIn = connect.Spec(
    '/$name/LogIn',
    connect.StreamType.unary,
    tattooappv1auth_service.LogInRequest.new,
    tattooappv1auth_service.LogInResponse.new,
  );

  static const refreshToken = connect.Spec(
    '/$name/RefreshToken',
    connect.StreamType.unary,
    tattooappv1auth_service.RefreshTokenRequest.new,
    tattooappv1auth_service.RefreshTokenResponse.new,
  );

  static const logOut = connect.Spec(
    '/$name/LogOut',
    connect.StreamType.unary,
    tattooappv1auth_service.LogOutRequest.new,
    tattooappv1auth_service.LogOutResponse.new,
  );
}
