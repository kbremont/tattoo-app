import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:tattooapp/src/features/auth/data/auth0_repository.dart';
import 'package:tattooapp/src/features/auth/application/login_use_case.dart';
import 'package:tattooapp/src/features/auth/application/dev_login_use_case.dart';
import 'package:tattooapp/src/features/auth/application/logout_use_case.dart';

// Auth0 instance
final auth0Provider = Provider((ref) {
  return Auth0(
    'dev-pqjo5e7nvurmgv1u.us.auth0.com',
    'pyWfA6FoOCY6eJQVOnFALxTUjtulATIu',
  );
});

final accessTokenProvider = StateProvider<String?>((ref) => null);

final auth0UserIdProvider = StateProvider<String?>((ref) => null);

// Auth0 repository
final auth0RepositoryProvider = Provider((ref) {
  final auth0 = ref.watch(auth0Provider);
  return Auth0Repository(auth0);
});

final loginUseCaseProvider = Provider((ref) {
  final repository = ref.read(auth0RepositoryProvider);
  return LoginUseCase(repository);
});

final devLoginUseCaseProvider = Provider((ref) {
  final repository = ref.read(auth0RepositoryProvider);
  return DevLoginUseCase(repository);
});

final logoutUseCaseProvider = Provider((ref) {
  final repo = ref.watch(auth0RepositoryProvider);
  return LogoutUseCase(repo);
});
