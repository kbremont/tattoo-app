import 'package:tattooapp/src/features/auth/data/auth0_repository.dart';

enum UserType { artist, client }

class DevLoginUseCase {
  final Auth0Repository _repository;

  DevLoginUseCase(this._repository);

  Future<DevCredentials> execute({required UserType userType}) async {
    final email = switch (userType) {
      UserType.artist => "test-artist@example.com",
      UserType.client => "test-client@example.com",
    };

    return await _repository.devLogin(email: email, password: "password123!");
  }
}
