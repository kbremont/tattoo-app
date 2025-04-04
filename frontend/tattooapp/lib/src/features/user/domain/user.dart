enum UserRole { artist, client }

class User {
  final String auth0UserId;
  final UserRole role;
  final String firstName;
  final String lastName;
  final List<String> stylePreferences;

  const User({
    required this.auth0UserId,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.stylePreferences,
  });

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     auth0UserId: json['id'] as String,
  //     firstName: json['firstName'] as String,
  //     lastName: json['lastName'] as String,
  //     stylePreferences: List<String>.from(json['stylePreferences'] ?? []),
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': auth0UserId,
  //     'firstName': firstName,
  //     'lastName': lastName,
  //     'stylePreferences': stylePreferences,
  //   };
  // }
}
