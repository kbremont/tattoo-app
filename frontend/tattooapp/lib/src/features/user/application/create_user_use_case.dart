import 'package:tattooapp/src/features/user/domain/user.dart';
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
      user: user.toProto(),
    );
  }
}
