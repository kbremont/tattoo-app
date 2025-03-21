import 'package:tattooapp/gen/dart/tattooapp/v1/auth_service.pb.dart';
import 'package:tattooapp/gen/dart/tattooapp/v1/auth.pb.dart';
import 'package:tattooapp/gen/dart/tattooapp/v1/auth_service.connect.client.dart';
import 'package:tattooapp/src/core/services/token_manager.dart';

class AuthRepository {
  final AuthServiceClient _client;
  final TokenManager _tokenManager;

  AuthRepository(this._client, this._tokenManager);

  Future<SignUpResponse> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    final request = SignUpRequest(
      credentials: UserCredentials(email: email, password: password),
      firstName: firstName,
      lastName: lastName,
    );

    final response = await _client.signUp(request);
    await _tokenManager.saveTokens(response.token);
    return response;
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
