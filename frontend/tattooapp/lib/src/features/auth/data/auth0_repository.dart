import 'dart:io';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:http/http.dart' as http;

class DevCredentials {
  final String accessToken;
  final String idToken;
  final DateTime expiresAt;

  DevCredentials({
    required this.accessToken,
    required this.idToken,
    required this.expiresAt,
  });
}

class Auth0Repository {
  final Auth0 _auth0;

  Auth0Repository(this._auth0);

  Future<String> getRedirectUrl() async {
    final simulator = await isSimulator();
    final redirectUrl =
        simulator
            ? 'tattooapp://callback'
            : 'com.kbremont.tattooapp://dev-pqjo5e7nvurmgv1u.us.auth0.com/ios/com.kbremont.tattooapp/callback';

    return redirectUrl;
  }

  Future<bool> isSimulator() async {
    if (!Platform.isIOS) return false; // Only care about iOS here

    final deviceInfo = DeviceInfoPlugin();
    final iosInfo = await deviceInfo.iosInfo;
    return iosInfo.isPhysicalDevice == false;
  }

  Future<Credentials?> getCredentialsSilently() async {
    if (await _auth0.credentialsManager.hasValidCredentials()) {
      return await _auth0.credentialsManager.credentials();
    }
    return null;
  }

  Future<Credentials> login() async {
    final redirectUrl = await getRedirectUrl();
    final credentials = await _auth0.webAuthentication().login(
      redirectUrl: redirectUrl,
      audience: 'https://dev-pqjo5e7nvurmgv1u.us.auth0.com/api/v2/',
    );

    return credentials;
  }

  // This method is for development purposes only
  // and should not be used in production.
  Future<DevCredentials> devLogin({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('https://dev-pqjo5e7nvurmgv1u.us.auth0.com/oauth/token'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'grant_type': 'password',
        'username': email,
        'password': password,
        'audience': 'https://dev-pqjo5e7nvurmgv1u.us.auth0.com/api/v2/',
        'client_id': 'idsGcSbT0rV3nZaxjeTY5XX69cDfJCsr',
        'client_secret':
            dotenv
                .env['DEV_AUTH0_CLIENT_SECRET'], // only in trusted/test context
        'scope': 'openid profile email',
        'connection': 'Username-Password-Authentication',
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed login: ${response.body}');
    }

    final json = jsonDecode(response.body);
    final accessToken = json['access_token'] as String;
    final idToken = json['id_token'] as String;
    final expiresIn = json['expires_in'] as int;

    return DevCredentials(
      accessToken: accessToken,
      idToken: idToken,
      expiresAt: DateTime.now().add(Duration(seconds: expiresIn)),
    );
  }

  Future<void> logout() async {
    final simulator = await isSimulator();
    if (simulator) {
      final logoutUrl = Uri.parse(
        'https://dev-pqjo5e7nvurmgv1u.us.auth0.com/v2/logout?client_id=pyWfA6FoOCY6eJQVOnFALxTUjtulATIu&returnTo=tattooapp://logout',
      );
      if (await canLaunchUrl(logoutUrl)) {
        await launchUrl(logoutUrl, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch logout URL';
      }
    } else {
      await _auth0.webAuthentication().logout();
    }
  }

  Future<String?> getAccessToken() async {
    // return _storage.read(key: 'access_token');
  }

  Future<String?> getIdToken() async {
    final credentials = await getCredentialsSilently();
    if (credentials == null) return null;
    return credentials.idToken;
  }
}
