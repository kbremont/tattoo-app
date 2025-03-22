import 'package:tattooapp/src/features/auth/data/auth0_repository.dart';

class LogoutUseCase {
  final Auth0Repository _repository;

  LogoutUseCase(this._repository);

  Future<void> execute() async {
    await _repository.logout();
  }
}
