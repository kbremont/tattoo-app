import 'package:tattooapp/src/features/auth/data/auth0_repository.dart';

class LoginUseCase {
  final Auth0Repository _repository;

  LoginUseCase(this._repository);

  Future<void> execute() async {
    await _repository.login();
  }
}
