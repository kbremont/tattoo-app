import 'package:tattooapp/src/features/user/data/user_repository.dart';
import 'package:tattooapp/src/features/user/domain/user.dart';
import 'package:tattooapp/gen/dart/tattooapp/user/v1/user.pb.dart' as proto;

class GetUserUseCase {
  final UserRepository _repository;

  GetUserUseCase(this._repository);

  Future<User> execute({
    required String accessToken,
    required String id,
  }) async {
    final protoUser = await _repository.getUser(
      accessToken: accessToken,
      id: id,
    );

    return _mapProtoUserToUser(protoUser);
  }
}

TattooStyles _mapProtoStyleToTattooStyle(proto.TattooStyle style) {
  switch (style) {
    case proto.TattooStyle.TATTOO_STYLE_AMERICAN_TRADITIONAL:
      return TattooStyles.americanTraditional;
    case proto.TattooStyle.TATTOO_STYLE_JAPANESE_TRADITIONAL:
      return TattooStyles.japaneseTraditional;
    case proto.TattooStyle.TATTOO_STYLE_REALISM:
      return TattooStyles.realism;
    case proto.TattooStyle.TATTOO_STYLE_WATER_COLOR:
      return TattooStyles.watercolor;
    default:
      return TattooStyles.americanTraditional; // Default case
  }
}

User _mapProtoUserToUser(proto.User protoUser) {
  UserRole role;
  switch (protoUser.role) {
    case proto.UserRole.USER_ROLE_ARTIST:
      role = UserRole.artist;
      break;
    case proto.UserRole.USER_ROLE_CLIENT:
      role = UserRole.client;
      break;
    default:
      throw Exception('Invalid user role');
  }

  return User(
    id: protoUser.id,
    role: role,
    firstName: protoUser.firstName,
    lastName: protoUser.lastName,
    stylePreferences:
        protoUser.stylePreferences.map(_mapProtoStyleToTattooStyle).toList(),
    avatarUrl: protoUser.hasAvatarUrl() ? protoUser.avatarUrl : null,
  );
}
