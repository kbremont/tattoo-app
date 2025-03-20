import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/data/user_repository.dart';
import 'signup_state.dart';
import '../domain/signup_failure.dart';

class SignupNotifier extends StateNotifier<SignupState> {
  final UserRepository userRepository;
  SignupNotifier({required this.userRepository}) : super(SignupState());

  Future<void> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final user = await userRepository.createUser(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
      state = state.copyWith(isLoading: false, user: user, error: null);
    } catch (error) {
      // Here we assume error is a SignupFailure; you may add more robust error handling.
      state = state.copyWith(isLoading: false, error: error as SignupFailure);
    }
  }
}
