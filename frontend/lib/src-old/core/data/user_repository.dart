import '../domain/user.dart';
import '../domain/user_failure.dart';
import '../../../../gen/dart/tattooapp/v1/user_service.connect.client.dart';
import '../../../../gen/dart/tattooapp/v1/user_service.pb.dart';

abstract class UserRepository {
  Future<User> createUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
}


class UserRepositoryImpl implements UserRepository {
  final UserServiceClient client;

  // The client here is generated to use Connect protocol.
  UserRepositoryImpl({required this.client});

  @override
  Future<User> createUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final request = CreateUserRequest(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );

    try {
      // Call the API using the Connect client.
      final response = await client.createUser(request);
      // Convert the Connect response to a User object.
      return User(
        id: response.userId.toString(),
        email: email,
        firstName: firstName,
        lastName: lastName,
      );
    } catch (error) {
      throw CreateUserFailure('Failed to create user: $error');
    }

    // return User(id: '1', email: email, firstName: firstName, lastName: lastName);
  }
}
