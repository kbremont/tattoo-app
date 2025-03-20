import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'signup_notifier.dart';
import 'signup_state.dart';
import '../../../core/application/user_provider.dart';

// Expose the SignupNotifier as a StateNotifierProvider.
final signupNotifierProvider =
    StateNotifierProvider<SignupNotifier, SignupState>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return SignupNotifier(userRepository: userRepository);
});