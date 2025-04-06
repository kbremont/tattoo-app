import 'package:tattooapp/src/features/user/domain/user.dart';
import 'package:tattooapp/gen/dart/tattooapp/user/v1/user.pb.dart' as proto;
import 'package:tattooapp/src/features/user/data/user_repository.dart';

class CreateUserUseCase {
  final UserRepository _repository;

  CreateUserUseCase(this._repository);

  Future<void> execute({
    required String accessToken,
    required User user,
  }) async {
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
    id: user.id,
    role: role,
    firstName: user.firstName,
    lastName: user.lastName,
    // stylePreferences: [], // TODO: Add style preferences
  );
}
