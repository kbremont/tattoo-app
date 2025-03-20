import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connect/transport.dart';
import '../data/login_repository.dart';
import 'login_notifier.dart';
import 'login_state.dart';
import '../../../../src/generated/login.pbconnect.dart';

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  final baseUrl = 'https://api.example.com'; // Adjust as needed.
  final transport = HttpTransport(baseUrl);
  final client = LoginServiceClient(transport);
  return LoginRepository(client: client);
});

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final repository = ref.watch(loginRepositoryProvider);
  return LoginNotifier(loginRepository: repository);
});
