import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/user.dart';

class SessionState {
  final User? user;
  final bool isLoading;
  final String? error;

  SessionState({this.user, this.isLoading = false, this.error});
}

class SessionNotifier extends StateNotifier<SessionState> {
  SessionNotifier() : super(SessionState());

  void updateUser(User user) {
    state = SessionState(user: user);
  }

  void clearUser() {
    state = SessionState();
  }
}

final sessionProvider = StateNotifierProvider<SessionNotifier, SessionState>((ref) {
  return SessionNotifier();
});
