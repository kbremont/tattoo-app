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
}
