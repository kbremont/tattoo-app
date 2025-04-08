import 'package:tattooapp/src/features/user/domain/user.dart';
import 'package:tattooapp/src/features/user/domain/partial_user_update.dart';
import 'package:tattooapp/src/features/user/data/user_repository.dart';
import 'package:tattooapp/gen/dart/tattooapp/user/v1/user.pb.dart' as proto;

class UpdateUserUseCase {
  final UserRepository _repo;

  UpdateUserUseCase(this._repo);

  Future<void> execute({
    required String accessToken,
    required String userId,
    required User originalUser,
    required PartialUserUpdate updatedUser,
  }) async {
    final fieldMask = updatedUser.computeFieldMask(originalUser);

    final updatedProto = proto.User(
      id: originalUser.id,
      // Only set fields that are not null
      firstName: updatedUser.firstName ?? originalUser.firstName,
      lastName: updatedUser.lastName ?? originalUser.lastName,
      avatarUrl: updatedUser.avatarUrl ?? originalUser.avatarUrl,
      // stylePreferences: updatedUser.stylePreferences ?? originalUser.stylePreferences,
    );

    await _repo.updateUser(
      accessToken: accessToken,
      user: updatedProto,
      fieldMaskPaths: fieldMask,
    );
  }
}
