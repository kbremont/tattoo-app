import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';
import 'package:tattooapp/src/features/user/domain/user.dart';
import 'package:tattooapp/src/features/user/data/user_service_client.dart';
import 'package:tattooapp/src/features/user/data/user_repository.dart';
import 'package:tattooapp/src/features/user/application/create_user_use_case.dart';
import 'package:tattooapp/src/features/user/application/get_user_use_case.dart';
import 'package:tattooapp/src/features/user/application/update_user_use_case.dart';
import 'package:tattooapp/src/features/user/application/new_user_state.dart';

// UserServiceClient Provider
final userServiceClientProvider = Provider((ref) {
  return UserServiceClientFactory.create();
});

// UserRepository Provider
final userRepositoryProvider = Provider((ref) {
  final client = ref.watch(userServiceClientProvider);
  return UserRepository(client);
});

// provides the current user
final userProvider = FutureProvider<User>((ref) async {
  final getUser = ref.read(getUserUseCaseProvider);
  final accessToken = ref.watch(accessTokenProvider);
  final id = ref.watch(auth0UserIdProvider);

  if (accessToken == null) throw Exception('Missing accessToken');
  if (id == null) throw Exception('Missing id');

  return await getUser.execute(accessToken: accessToken, id: id);
});

// provides the given user
final getUserProvider = FutureProvider.family<User, String>((ref, id) async {
  final getUser = ref.read(getUserUseCaseProvider);
  final accessToken = ref.watch(accessTokenProvider);

  if (accessToken == null) throw Exception('Missing accessToken');

  return await getUser.execute(accessToken: accessToken, id: id);
});

// CreateUserUseCase Provider
final createUserUseCaseProvider = Provider((ref) {
  final repo = ref.watch(userRepositoryProvider);
  return CreateUserUseCase(repo);
});

// GetUserUseCase Provider
final getUserUseCaseProvider = Provider((ref) {
  final repo = ref.watch(userRepositoryProvider);
  return GetUserUseCase(repo);
});

// UpdateUserUseCase Provider
final updateUserUseCaseProvider = Provider((ref) {
  final repo = ref.watch(userRepositoryProvider);
  return UpdateUserUseCase(repo);
});

class NewUserStateNotifier extends StateNotifier<NewUserState> {
  NewUserStateNotifier() : super(const NewUserState());

  void updateFull({required String id, String? firstName, String? lastName}) {
    state = state.copyWith(id: id, firstName: firstName, lastName: lastName);
  }

  void updateRole(UserRole role) {
    state = state.copyWith(role: role);
  }

  void updateName({required String firstName, required String lastName}) {
    state = state.copyWith(firstName: firstName, lastName: lastName);
  }

  void updateStylePreferences(List<TattooStyles> styles) {
    state = state.copyWith(stylePreferences: styles);
  }

  void reset() {
    state = const NewUserState();
  }
}

final newUserStateProvider =
    StateNotifierProvider<NewUserStateNotifier, NewUserState>(
      (ref) => NewUserStateNotifier(),
    );
