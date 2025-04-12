import 'package:tattooapp/src/features/client/data/client_profiles_repository.dart';
import 'package:tattooapp/src/features/client/domain/client_profile.dart';

class GetClientProfileUseCase {
  final ClientProfilesRepository _clientProfilesRepository;

  GetClientProfileUseCase(this._clientProfilesRepository);

  Future<ClientProfile> execute({
    required String accessToken,
    required String userId,
  }) async {
    try {
      final protoClientProfile = await _clientProfilesRepository
          .getClientProfile(accessToken: accessToken, userId: userId);

      return ClientProfile.fromProto(protoClientProfile);
    } catch (e) {
      throw Exception('Failed to create artist profile: $e');
    }
  }
}
