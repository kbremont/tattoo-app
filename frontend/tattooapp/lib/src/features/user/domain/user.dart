enum UserRole { artist, client }

class User {
  final String id;
  final UserRole role;
  final String firstName;
  final String lastName;
  final List<String> stylePreferences;

  const User({
    required this.id,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.stylePreferences,
  });
}
