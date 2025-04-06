import 'package:tattooapp/gen/dart/tattooapp/user/v1/user_service.pb.dart';
import 'package:tattooapp/gen/dart/tattooapp/user/v1/user.pb.dart';
import 'package:tattooapp/gen/dart/tattooapp/user/v1/user_service.connect.client.dart';
import 'package:tattooapp/src/core/utils/auth_headers.dart';

class UserRepository {
  final UserServiceClient _client;

  UserRepository(this._client);

  Future<void> createUser({
    required String accessToken,
    required User user,
  }) async {
    await _client.createUser(
      CreateUserRequest(
        id: user.id,
        role: user.role,
        firstName: user.firstName,
        lastName: user.lastName,
      ),
      headers: authHeaders(accessToken),
    );
  }

  Future<User> getUser({
    required String accessToken,
    required String id,
  }) async {
    final response = await _client.getUser(
      GetUserRequest(id: id),
      headers: authHeaders(accessToken),
    );

    return response.user;
  }

  Future<void> updateUser({
    required String accessToken,
    required User user,
  }) async {
    await _client.updateUser(
      UpdateUserRequest(user: user),
      headers: authHeaders(accessToken),
    );
  }
}
