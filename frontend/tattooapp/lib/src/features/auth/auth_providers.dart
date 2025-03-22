import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tattooapp/src/features/auth/data/auth0_repository.dart';
import 'package:tattooapp/src/features/auth/application/login_use_case.dart';
import 'package:tattooapp/src/features/auth/application/logout_use_case.dart';

// FlutterSecureStorage
final secureStorageProvider = Provider((ref) => const FlutterSecureStorage());

// Auth0 instance
final auth0Provider = Provider((ref) {
  return Auth0(
    'dev-pqjo5e7nvurmgv1u.us.auth0.com',
    'pyWfA6FoOCY6eJQVOnFALxTUjtulATIu',
  );
});

// Auth0 repository
final auth0RepositoryProvider = Provider((ref) {
  final auth0 = ref.watch(auth0Provider);
  final storage = ref.watch(secureStorageProvider);
  return Auth0Repository(auth0, storage);
});

// Use cases
final loginUseCaseProvider = Provider((ref) {
  final repo = ref.watch(auth0RepositoryProvider);
  return LoginUseCase(repo);
});

final logoutUseCaseProvider = Provider((ref) {
  final repo = ref.watch(auth0RepositoryProvider);
  return LogoutUseCase(repo);
});
