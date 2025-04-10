import 'package:tattooapp/src/features/user/domain/user.dart';

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

bool _listEquals(List<TattooStyles> a, List<TattooStyles> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
