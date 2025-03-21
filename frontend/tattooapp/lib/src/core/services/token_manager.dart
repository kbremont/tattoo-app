import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tattooapp/gen/dart/tattooapp/v1/auth_service.connect.client.dart';
import 'package:tattooapp/gen/dart/tattooapp/v1/auth.pb.dart';
import 'package:tattooapp/gen/dart/tattooapp/v1/auth_service.pb.dart';

class TokenManager {
  final FlutterSecureStorage _storage;
  final AuthServiceClient _authClient;

  TokenManager(this._storage, this._authClient);

  Future<void> saveTokens(AuthToken token) async {
    await _storage.write(key: 'access_token', value: token.accessToken);
    await _storage.write(key: 'refresh_token', value: token.refreshToken);
  }

  Future<void> clearTokens() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
  }

  Future<String?> getAccessToken() async {
    return _storage.read(key: 'access_token');
  }

  Future<void> refreshTokens() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null) throw Exception('No refresh token available');

    final response = await _authClient.refreshToken(
      RefreshTokenRequest(refreshToken: refreshToken),
    );
    await saveTokens(response.token);
  }
}
