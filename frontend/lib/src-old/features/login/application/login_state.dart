import '../../../core/domain/user.dart';
import '../domain/login_failure.dart';

class LoginState {
  final bool isLoading;
  final User? user;
  final LoginFailure? error;

  LoginState({this.isLoading = false, this.user, this.error});

  LoginState copyWith({
    bool? isLoading,
    User? user,
    LoginFailure? error,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}
