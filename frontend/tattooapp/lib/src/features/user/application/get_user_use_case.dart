import 'package:tattooapp/src/features/user/data/user_repository.dart';
import 'package:tattooapp/src/features/user/domain/user.dart';

class GetUserUseCase {
  final UserRepository _repository;

  GetUserUseCase(this._repository);

  Future<User> execute({
    required String accessToken,
    required String id,
  }) async {
    final protoUser = await _repository.getUser(
      accessToken: accessToken,
      id: id,
    );

    return User.fromProto(protoUser);
  }
}
