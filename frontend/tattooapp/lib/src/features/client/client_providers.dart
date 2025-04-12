import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';
import 'package:tattooapp/src/features/client/data/client_service_client.dart';
import 'package:tattooapp/src/features/client/data/client_profiles_repository.dart';
import 'package:tattooapp/src/features/client/application/new_client_profile_state.dart';
import 'package:tattooapp/src/features/client/application/create_client_profile_use_case.dart';
import 'package:tattooapp/src/features/client/application/get_client_profile_use_case.dart';

final clientServiceClientProvider = Provider((ref) {
  return ClientServiceClientFactory.create();
});

final clientProfilesRepositoryProvider = Provider((ref) {
  final client = ref.watch(clientServiceClientProvider);
  return ClientProfilesRepository(client);
});

final createClientProfileUseCaseProvider = Provider((ref) {
  final repo = ref.watch(clientProfilesRepositoryProvider);
  return CreateClientProfileUseCase(repo);
});

final getClientProfileUseCaseProvider = Provider((ref) {
  final repo = ref.watch(clientProfilesRepositoryProvider);
  return GetClientProfileUseCase(repo);
});

// provides the current client profile
final clientProfileProvider = FutureProvider((ref) async {
  final getClientProfile = ref.read(getClientProfileUseCaseProvider);
  final accessToken = ref.watch(accessTokenProvider);
  final userId = ref.watch(auth0UserIdProvider);

  if (accessToken == null) throw Exception('Missing accessToken');
  if (userId == null) throw Exception('Missing id');

  return await getClientProfile.execute(
    accessToken: accessToken,
    userId: userId,
  );
});

// provides the given client profile
final getClientProfileProvider = FutureProvider.family((
  ref,
  String userId,
) async {
  final getClientProfile = ref.read(getClientProfileUseCaseProvider);
  final accessToken = ref.watch(accessTokenProvider);

  if (accessToken == null) throw Exception('Missing accessToken');

  return await getClientProfile.execute(
    accessToken: accessToken,
    userId: userId,
  );
});

final class NewClientProfileStateNotifier
    extends StateNotifier<NewClientProfileState> {
  NewClientProfileStateNotifier() : super(const NewClientProfileState());

  void update({required String location}) {
    state = state.copyWith(location: location);
  }

  void clear() {
    state = const NewClientProfileState();
  }
}

final newClientProfileStateProvider =
    StateNotifierProvider<NewClientProfileStateNotifier, NewClientProfileState>(
      (ref) => NewClientProfileStateNotifier(),
    );
