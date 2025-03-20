import 'dart:async';

// Import the shared User model.
import '../../../core/domain/user.dart';
// Import the login failure class.
import '../domain/login_failure.dart';
// Import the generated protobuf files for Connect.
import '../../../../src/generated/login.pb.dart';
import '../../../../src/generated/login.pbconnect.dart';

/// Abstract class defining the contract for the login repository.
abstract class LoginRepository {
  Future<User> loginWithEmail({required String email, required String password});
  Future<User> loginWithGoogle({required String googleToken});
}

/// Concrete implementation of [LoginRepository] using the Connect client.
class LoginRepositoryImpl implements LoginRepository {
  final LoginServiceClient client;

  LoginRepositoryImpl({required this.client});

  @override
  Future<User> loginWithEmail({required String email, required String password}) async {
    final request = LoginWithEmailRequest(email: email, password: password);
    try {
      final response = await client.loginWithEmail(request);
      return User(
        id: response.id,
        email: response.email,
        firstName: response.firstName,
        lastName: response.lastName,
      );
    } catch (error) {
      throw LoginFailure('Email login failed: $error');
    }
  }

  @override
  Future<User> loginWithGoogle({required String googleToken}) async {
    final request = LoginWithGoogleRequest(googleToken: googleToken);
    try {
      final response = await client.loginWithGoogle(request);
      return User(
        id: response.id,
        email: response.email,
        firstName: response.firstName,
        lastName: response.lastName,
      );
    } catch (error) {
      throw LoginFailure('Google login failed: $error');
    }
  }
}
