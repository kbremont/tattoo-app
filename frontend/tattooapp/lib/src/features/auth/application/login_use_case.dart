import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:tattooapp/src/features/auth/data/auth0_repository.dart';

class LoginUseCase {
  final Auth0Repository _repository;

  LoginUseCase(this._repository);

  Future<Credentials> execute() async {
    return await _repository.getCredentialsSilently() ??
        await _repository.login();
  }
}
