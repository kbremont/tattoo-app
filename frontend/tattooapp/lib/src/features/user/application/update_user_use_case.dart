import 'package:tattooapp/gen/dart/tattooapp/user/v1/user_service.pb.dart';
import 'package:tattooapp/src/features/user/data/user_repository.dart';
import 'package:tattooapp/gen/dart/tattooapp/user/v1/user.pb.dart' as proto;

class UpdateUserUseCase {
  final UserRepository _repo;

  UpdateUserUseCase(this._repo);

  Future<void> execute({
    required String accessToken,
    required String userId,
    String? firstName,
    String? lastName,
    String? avatarUrl,
  }) async {
    final user = proto.User(id: userId);

    if (firstName != null) {
      user.firstName = firstName;
    }
    if (lastName != null) {
      user.lastName = lastName;
    }
    if (avatarUrl != null) {
      user.avatarUrl = avatarUrl;
    }
    await _repo.updateUser(accessToken: accessToken, user: user);
  }
}
