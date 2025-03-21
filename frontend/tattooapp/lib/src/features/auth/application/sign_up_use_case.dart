import 'package:tattooapp/src/features/auth/data/auth_repository.dart';
import 'package:tattooapp/gen/dart/tattooapp/v1/auth_service.pb.dart';

class SignUpUseCase {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  Future<SignUpResponse> execute({
    required String email,
    required String password,
  }) {
    return _repository.signUp(email, password);
  }
}
