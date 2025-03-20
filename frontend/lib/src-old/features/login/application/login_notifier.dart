import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/domain/user.dart';
import '../domain/login_failure.dart';
import '../data/login_repository.dart';
import 'login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginRepository loginRepository;

  LoginNotifier({required this.loginRepository}) : super(LoginState());

  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final user = await loginRepository.loginWithEmail(email: email, password: password);
      state = state.copyWith(isLoading: false, user: user, error: null);
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error as LoginFailure);
    }
  }

  Future<void> loginWithGoogle({required String googleToken}) async {
    state = state.copyWith(isLoading: true);
    try {
      final user = await loginRepository.loginWithGoogle(googleToken: googleToken);
      state = state.copyWith(isLoading: false, user: user, error: null);
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error as LoginFailure);
    }
  }
}
