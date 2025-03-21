import 'package:tattooapp/src/features/auth/data/auth_repository.dart';
import 'package:tattooapp/gen/dart/tattooapp/v1/auth_service.pb.dart';

class LogInUseCase {
  final AuthRepository _repository;

  LogInUseCase(this._repository);

  Future<LogInResponse> execute({
    required String email,
    required String password,
  }) {
    return _repository.logIn(email, password);
  }
}
