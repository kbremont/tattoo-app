import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/user/user_providers.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';
import 'package:tattooapp/src/features/auth/application/login_use_case.dart';
import 'package:tattooapp/src/features/auth/application/dev_login_use_case.dart';
import 'package:tattooapp/src/features/user/application/get_user_use_case.dart';

enum SessionDestination { profile, onboarding }

class SessionCoordinator {
  final Ref _ref;
  final LoginUseCase _loginUseCase;
  final GetUserUseCase _getUserUseCase;
  final DevLoginUseCase _devLoginUseCase;

  SessionCoordinator(
    this._ref,
    this._loginUseCase,
    this._getUserUseCase,
    this._devLoginUseCase,
  );

  Future<SessionDestination> startSession() async {
    final credentials = await _loginUseCase.execute();
    final accessToken = credentials.accessToken;
    _ref.read(accessTokenProvider.notifier).state = accessToken;

    final decoded = JwtDecoder.decode(credentials.idToken);
    final auth0UserId = decoded['sub'];
    _ref.read(auth0UserIdProvider.notifier).state = auth0UserId;

    final firstName = decoded['given_name'] as String?;
    final lastName = decoded['family_name'] as String?;

    try {
      await _getUserUseCase.execute(accessToken: accessToken, id: auth0UserId);
      return SessionDestination.profile;
    } catch (_) {
      _ref
          .read(newUserStateProvider.notifier)
          .updateFull(
            id: auth0UserId,
            firstName: firstName,
            lastName: lastName,
          );
      return SessionDestination.onboarding;
    }
  }

  Future<void> startDevSession(String userType) async {
    final uType = switch (userType) {
      "client" => UserType.client,
      "artist" => UserType.artist,
      _ => throw Exception("Invalid user type"),
    };

    final credentials = await _devLoginUseCase.execute(userType: uType);
    final accessToken = credentials.accessToken;
    _ref.read(accessTokenProvider.notifier).state = accessToken;

    final decoded = JwtDecoder.decode(credentials.idToken);
    final auth0UserId = decoded['sub'];
    _ref.read(auth0UserIdProvider.notifier).state = auth0UserId;
  }
}
