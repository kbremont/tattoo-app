import 'package:tattooapp/gen/dart/tattooapp/v1/user_service.pb.dart';
import 'package:tattooapp/gen/dart/tattooapp/v1/user.pb.dart';
import 'package:tattooapp/gen/dart/tattooapp/v1/user_service.connect.client.dart';
import 'package:tattooapp/src/core/utils/auth_headers.dart';

class UserRepository {
  final UserServiceClient _client;

  UserRepository(this._client);

  Future<void> createUser({
    required String accessToken,
    required String auth0UserId,
    required String firstName,
    required String lastName,
  }) async {
    await _client.createUser(
      CreateUserRequest(
        auth0UserId: auth0UserId,
        firstName: firstName,
        lastName: lastName,
      ),
      headers: authHeaders(accessToken),
    );
  }

  Future<User> getUser({
    required String accessToken,
    required String auth0UserId,
  }) async {
    final response = await _client.getUser(
      GetUserRequest(auth0UserId: auth0UserId),
      headers: authHeaders(accessToken),
    );

    return response.user;
  }
}
