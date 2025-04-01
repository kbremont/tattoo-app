import 'package:tattooapp/src/features/user/data/user_repository.dart';
import 'package:tattooapp/src/features/user/domain/user.dart';

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

    return User(
      auth0UserId: protoUser.auth0UserId,
      firstName: protoUser.firstName,
      lastName: protoUser.lastName,
      stylePreferences: [], // TODO: Add style preferences
    );
  }
}
