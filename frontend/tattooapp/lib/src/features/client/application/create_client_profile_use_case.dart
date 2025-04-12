import 'package:tattooapp/src/features/client/data/client_profiles_repository.dart';
import 'package:tattooapp/src/features/client/domain/client_profile.dart';

class CreateClientProfileUseCase {
  final ClientProfilesRepository _clientProfilesRepository;

  CreateClientProfileUseCase(this._clientProfilesRepository);

  Future<void> execute({
    required String accessToken,
    required ClientProfile client,
  }) async {
    try {
      await _clientProfilesRepository.createClientProfile(
        accessToken: accessToken,
        clientProfile: client.toProto(),
      );
    } catch (e) {
      throw Exception('Failed to create artist profile: $e');
    }
  }
}
