import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth0Repository {
  final Auth0 _auth0;
  final FlutterSecureStorage _storage;

  Auth0Repository(this._auth0, this._storage);

  Future<void> login() async {
    final credentials = await _auth0.webAuthentication().login(useHTTPS: true);
    await _storage.write(key: 'access_token', value: credentials.accessToken);
    await _storage.write(key: 'id_token', value: credentials.idToken);
  }

  Future<void> logout() async {
    await _auth0.webAuthentication().logout(useHTTPS: true);
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'id_token');
  }

  Future<String?> getAccessToken() async {
    return _storage.read(key: 'access_token');
  }

  Future<String?> getIdToken() async {
    return _storage.read(key: 'id_token');
  }
}
