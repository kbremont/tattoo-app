import '../../../../gen/dart/tattooapp/v1/user_service.connect.client.dart';
import '../../../../gen/dart/tattooapp/v1/user_service.pb.dart';
import '../../../core/domain/user.dart';

abstract class AuthRepository {
  Future<User> login({required String email, required String password});
  Future<User> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  final UserServiceClient _client;

  AuthRepositoryImpl(this._client);

  @override
  Future<User> login({required String email, required String password}) async {
    // Call your API's login endpoint.
    // final response = await _client.login(LoginRequest(email: email, password: password));
    // return User(
    //   id: response.user.id,
    //   email: response.user.email,
    //   name: response.user.name,
    // );
    return User(id: '1', email: email, firstName: 'John', lastName: 'Doe');
  }

  @override
  Future<User> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    // Call your API's createUser endpoint.
    final response = await _client.createUser(
      CreateUserRequest(email: email, password: password, firstName: firstName, lastName: lastName),
    );
    return User(id: response.userId.toString(), email: email, firstName: firstName, lastName: lastName);
  }
}
