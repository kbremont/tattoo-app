import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/user/domain/user.dart';
import 'package:tattooapp/gen/dart/tattooapp/v1/user.pb.dart' as proto;
import 'package:tattooapp/src/features/user/data/user_repository.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';

class CreateUserUseCase {
  final UserRepository _repository;
  final Ref _ref;

  CreateUserUseCase(this._repository, this._ref);

  Future<void> execute(User user) async {
    final accessToken = _ref.read(accessTokenProvider);
    if (accessToken == null) {
      throw Exception('Access token is null');
    }

    await _repository.createUser(
      accessToken: accessToken,
      user: _mapUserToProtoUser(user),
    );
  }
}

proto.User _mapUserToProtoUser(User user) {
  proto.UserRole role;
  switch (user.role) {
    case UserRole.artist:
      role = proto.UserRole.USER_ROLE_ARTIST;
      break;
    case UserRole.client:
      role = proto.UserRole.USER_ROLE_CLIENT;
      break;
  }

  return proto.User(
    auth0UserId: user.auth0UserId,
    role: role,
    firstName: user.firstName,
    lastName: user.lastName,
    // stylePreferences: [], // TODO: Add style preferences
  );
}
