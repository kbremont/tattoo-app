import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_notifier.dart';
import '../data/auth_repository.dart';
import '../../../core/data/user_client.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final client = createUserServiceClient();
  final repository = AuthRepositoryImpl(client);
  return AuthNotifier(repository: repository, ref: ref);
});
