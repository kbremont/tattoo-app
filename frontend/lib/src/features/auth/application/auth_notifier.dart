import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/user.dart';
import '../../../core/application/session_notifier.dart';
import '../data/auth_repository.dart';

class AuthState {
  final bool isLoading;
  final String? error;

  AuthState({this.isLoading = false, this.error});
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository repository;
  final Ref ref;

  AuthNotifier({required this.repository, required this.ref}) : super(AuthState());

  Future<void> login(String email, String password) async {
    state = AuthState(isLoading: true);
    try {
      final user = await repository.login(email: email, password: password);
      // Update global session upon successful login.
      ref.read(sessionProvider.notifier).updateUser(user);
      state = AuthState();
    } catch (e) {
      state = AuthState(error: e.toString());
    }
  }

  Future<void> signUp(String email, String password, String firstName, String lastName) async {
    state = AuthState(isLoading: true);
    try {
      final user = await repository.signUp(email: email, password: password, firstName: firstName, lastName: lastName);
      // Update global session upon successful sign-up.
      ref.read(sessionProvider.notifier).updateUser(user);
      state = AuthState();
    } catch (e) {
      state = AuthState(error: e.toString());
    }
  }
}
