import 'package:tattooapp/src/features/user/domain/user.dart';
import 'package:tattooapp/src/features/user/domain/partial_user_update.dart';
import 'package:tattooapp/src/features/user/data/user_repository.dart';

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

    final updatedProto = updatedUser.toProto(
      userId: userId,
      originalUser: originalUser,
    );

    await _repo.updateUser(
      accessToken: accessToken,
      user: updatedProto,
      fieldMaskPaths: fieldMask,
    );
  }
}
