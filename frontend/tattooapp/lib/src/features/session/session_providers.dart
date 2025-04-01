import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';
import 'package:tattooapp/src/features/user/user_providers.dart';
import 'package:tattooapp/src/features/session/application/session_coordinator.dart';

final sessionCoordinatorProvider = Provider((ref) {
  final loginUseCase = ref.watch(loginUseCaseProvider);
  final getUserUseCase = ref.watch(getUserUseCaseProvider);

  return SessionCoordinator(ref, loginUseCase, getUserUseCase);
});
