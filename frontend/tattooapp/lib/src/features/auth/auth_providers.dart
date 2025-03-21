import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/auth/data/auth_repository.dart';
import 'package:tattooapp/src/features/auth/application/sign_up_use_case.dart';
import 'package:tattooapp/src/features/auth/application/log_in_use_case.dart';
import 'package:tattooapp/src/features/auth/domain/auth_service_client.dart';

// Service client factory
final authServiceClientFactoryProvider = Provider((ref) => AuthServiceClientFactory());

// Service client
final authServiceClientProvider = Provider((ref) {
  final factory = ref.watch(authServiceClientFactoryProvider);
  return factory.createClient();
});

// Repository
final authRepositoryProvider = Provider((ref) {
  final client = ref.watch(authServiceClientProvider);
  return AuthRepository(client);
});

// Use cases
final signUpUseCaseProvider = Provider((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return SignUpUseCase(repo);
});

final logInUseCaseProvider = Provider((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return LogInUseCase(repo);
});