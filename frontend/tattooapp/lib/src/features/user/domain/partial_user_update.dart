import 'package:tattooapp/src/features/user/domain/user.dart';
import 'package:tattooapp/gen/dart/tattooapp/user/v1/user.pb.dart' as proto;
import 'package:tattooapp/src/features/user/domain/tattoo_style_mapper.dart';

class PartialUserUpdate {
  final String? firstName;
  final String? lastName;
  final List<TattooStyles>? stylePreferences;
  final String? avatarUrl;

  const PartialUserUpdate({
    this.firstName,
    this.lastName,
    this.stylePreferences,
    this.avatarUrl,
  });

  List<String> computeFieldMask(User original) {
    final paths = <String>[];

    if (firstName != null && firstName != original.firstName) {
      paths.add('first_name');
    }
    if (lastName != null && lastName != original.lastName) {
      paths.add('last_name');
    }
    if (avatarUrl != null && avatarUrl != original.avatarUrl) {
      paths.add('avatar_url');
    }
    if (stylePreferences != null &&
        !_listEquals(stylePreferences!, original.stylePreferences)) {
      paths.add('style_preferences');
    }

    return paths;
  }
}

extension PartialUserUpdateMapper on PartialUserUpdate {
  proto.User toProto({required String userId, required User originalUser}) {
    return proto.User(
      id: userId,
      firstName: firstName ?? originalUser.firstName,
      lastName: lastName ?? originalUser.lastName,
      avatarUrl: avatarUrl ?? originalUser.avatarUrl,
      stylePreferences:
          (stylePreferences ?? originalUser.stylePreferences)
              .map(mapTattooStyleToProtoStyle)
              .toList(),
    );
  }
}

bool _listEquals(List<TattooStyles> a, List<TattooStyles> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
