import 'package:tattooapp/gen/dart/tattooapp/v1/auth_service.pb.dart';
import 'package:tattooapp/gen/dart/tattooapp/v1/auth.pb.dart';
import 'package:tattooapp/gen/dart/tattooapp/v1/auth_service.connect.client.dart';

class AuthRepository {
  final AuthServiceClient _client;

  AuthRepository(this._client);

  Future<SignUpResponse> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) {
    final request = SignUpRequest(
      credentials: UserCredentials(email: email, password: password),
      firstName: firstName,
      lastName: lastName,
    );
    return _client.signUp(request);
  }

  Future<LogInResponse> logIn(String email, String password) {
    final request = LogInRequest(
      credentials: UserCredentials(email: email, password: password),
    );
    return _client.logIn(request);
  }

  Future<RefreshTokenResponse> refreshToken(String refreshToken) {
    final request = RefreshTokenRequest(refreshToken: refreshToken);
    return _client.refreshToken(request);
  }

  Future<LogOutResponse> logOut(String refreshToken) {
    final request = LogOutRequest(refreshToken: refreshToken);
    return _client.logOut(request);
  }
}
