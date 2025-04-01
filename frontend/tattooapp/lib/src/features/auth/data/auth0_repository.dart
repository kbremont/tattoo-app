import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

class Auth0Repository {
  final Auth0 _auth0;

  Auth0Repository(this._auth0);

  Future<String> getRedirectUrl() async {
    final simulator = await isSimulator();
    final redirectUrl =
        simulator
            ? 'tattooapp://callback'
            : 'https://dev-pqjo5e7nvurmgv1u.us.auth0.com/ios/com.example.tattooapp/callback';

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
