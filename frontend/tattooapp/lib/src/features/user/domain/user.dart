import 'package:tattooapp/gen/dart/tattooapp/user/v1/user.pb.dart' as proto;
import 'package:tattooapp/src/features/user/domain/tattoo_style_mapper.dart';

enum UserRole { artist, client }

enum TattooStyles {
  americanTraditional,
  japaneseTraditional,
  realism,
  watercolor,
}

class User {
  final String id;
  final UserRole role;
  final String firstName;
  final String lastName;
  final List<TattooStyles> stylePreferences;
  final String? avatarUrl;

  const User({
    required this.id,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.stylePreferences,
    this.avatarUrl,
  });

  User copyWith({
    UserRole? role,
    String? firstName,
    String? lastName,
    List<TattooStyles>? stylePreferences,
    String? avatarUrl,
  }) {
    return User(
      id: id,
      role: role ?? this.role,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      stylePreferences: stylePreferences ?? this.stylePreferences,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  factory User.fromProto(proto.User protoUser) {
    final role = switch (protoUser.role) {
      proto.UserRole.USER_ROLE_ARTIST => UserRole.artist,
      proto.UserRole.USER_ROLE_CLIENT => UserRole.client,
      _ => throw Exception('Invalid user role'),
    };

    return User(
      id: protoUser.id,
      role: role,
      firstName: protoUser.firstName,
      lastName: protoUser.lastName,
      stylePreferences:
          protoUser.stylePreferences.map(mapProtoStyleToTattooStyle).toList(),
      avatarUrl: protoUser.hasAvatarUrl() ? protoUser.avatarUrl : null,
    );
  }
}

extension UserMapper on User {
  proto.User toProto() {
    final role = switch (this.role) {
      UserRole.artist => proto.UserRole.USER_ROLE_ARTIST,
      UserRole.client => proto.UserRole.USER_ROLE_CLIENT,
    };

    return proto.User(
      id: id,
      role: role,
      firstName: firstName,
      lastName: lastName,
      stylePreferences: stylePreferences.map(mapTattooStyleToProtoStyle),
    );
  }
}
