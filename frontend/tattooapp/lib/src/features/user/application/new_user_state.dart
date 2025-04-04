import 'package:tattooapp/src/features/user/domain/user.dart';

class NewUserState {
  final String? id;
  final UserRole? role;
  final String? firstName;
  final String? lastName;
  final List<String> stylePreferences;

  const NewUserState({
    this.id,
    this.role,
    this.firstName,
    this.lastName,
    this.stylePreferences = const [],
  });

  NewUserState copyWith({
    String? id,
    UserRole? role,
    String? firstName,
    String? lastName,
    List<String>? stylePreferences,
  }) {
    return NewUserState(
      id: id ?? this.id,
      role: role ?? this.role,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      stylePreferences: stylePreferences ?? this.stylePreferences,
    );
  }

  bool get isComplete =>
      id != null &&
      firstName != null &&
      lastName != null &&
      stylePreferences.isNotEmpty;

  User toUser() {
    return User(
      id: id!,
      role: role!,
      firstName: firstName!,
      lastName: lastName!,
      stylePreferences: stylePreferences,
    );
  }
}
