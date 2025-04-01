import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/user/application/new_user_state.dart';
import 'package:tattooapp/src/features/user/data/user_repository.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';

class CreateUserUseCase {
  final UserRepository _repository;
  final Ref _ref;

  CreateUserUseCase(this._repository, this._ref);

  Future<void> execute(NewUserState newUser) async {
    final accessToken = _ref.read(accessTokenProvider);
    if (accessToken == null) {
      throw Exception('Access token is null');
    }

    await _repository.createUser(
      accessToken: accessToken,
      auth0UserId: newUser.auth0UserId!,
      firstName: newUser.firstName!,
      lastName: newUser.lastName!,
      // stylePreferences: newUser.stylePreferences,
    );
  }
}
