import 'package:tattooapp/src/features/user/data/user_repository.dart';
import 'package:tattooapp/src/features/user/domain/user.dart';
import 'package:tattooapp/gen/dart/tattooapp/v1/user.pb.dart' as proto;

class GetUserUseCase {
  final UserRepository _repository;

  GetUserUseCase(this._repository);

  Future<User> execute({
    required String accessToken,
    required String auth0UserId,
  }) async {
    final protoUser = await _repository.getUser(
      accessToken: accessToken,
      auth0UserId: auth0UserId,
    );

    return _mapProtoUserToUser(protoUser);
  }
}

User _mapProtoUserToUser(proto.User protoUser) {
  UserRole role;
  switch (protoUser.role) {
    case proto.UserRole.USER_ROLE_ARTIST:
      role = UserRole.artist;
      break;
    case proto.UserRole.USER_ROLE_CLIENT:
      role = UserRole.client;
      break;
    default:
      throw Exception('Invalid user role');
  }

  return User(
    auth0UserId: protoUser.auth0UserId,
    role: role,
    firstName: protoUser.firstName,
    lastName: protoUser.lastName,
    stylePreferences: [], // TODO: Add style preferences
  );
}
