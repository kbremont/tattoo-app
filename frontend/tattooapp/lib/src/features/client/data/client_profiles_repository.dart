import 'package:tattooapp/gen/dart/tattooapp/client/v1/client_service.connect.client.dart';
import 'package:tattooapp/gen/dart/tattooapp/client/v1/client_service.pb.dart';
import 'package:tattooapp/gen/dart/tattooapp/client/v1/client_profile.pb.dart';
import 'package:tattooapp/src/core/utils/auth_headers.dart';

class ClientProfilesRepository {
  final ClientServiceClient _client;

  ClientProfilesRepository(this._client);

  Future<void> createClientProfile({
    required String accessToken,
    required ClientProfile clientProfile,
  }) async {
    await _client.createClientProfile(
      CreateClientProfileRequest(
        userId: clientProfile.userId,
        location: clientProfile.location,
      ),
      headers: authHeaders(accessToken),
    );
  }

  Future<ClientProfile> getClientProfile({
    required String accessToken,
    required String userId,
  }) async {
    final response = await _client.getClientProfile(
      GetClientProfileRequest(userId: userId),
      headers: authHeaders(accessToken),
    );

    return response.clientProfile;
  }
}
