import '../../../core/domain/user.dart';
import '../domain/signup_failure.dart';

class SignupState {
  final bool isLoading;
  final User? user;
  final SignupFailure? error;

  SignupState({this.isLoading = false, this.user, this.error});

  SignupState copyWith({
    bool? isLoading,
    User? user,
    SignupFailure? error,
  }) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}
