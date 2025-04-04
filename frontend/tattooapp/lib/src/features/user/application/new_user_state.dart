import 'package:tattooapp/src/features/user/domain/user.dart';

class NewUserState {
  final String? auth0UserId;
  final UserRole? role;
  final String? firstName;
  final String? lastName;
  final List<String> stylePreferences;

  const NewUserState({
    this.auth0UserId,
    this.role,
    this.firstName,
    this.lastName,
    this.stylePreferences = const [],
  });

  NewUserState copyWith({
    String? auth0UserId,
    UserRole? role,
    String? firstName,
    String? lastName,
    List<String>? stylePreferences,
  }) {
    return NewUserState(
      auth0UserId: auth0UserId ?? this.auth0UserId,
      role: role ?? this.role,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      stylePreferences: stylePreferences ?? this.stylePreferences,
    );
  }

  bool get isComplete =>
      auth0UserId != null &&
      firstName != null &&
      lastName != null &&
      stylePreferences.isNotEmpty;

  User toUser() {
    return User(
      auth0UserId: auth0UserId!,
      role: role!,
      firstName: firstName!,
      lastName: lastName!,
      stylePreferences: stylePreferences,
    );
  }
}
