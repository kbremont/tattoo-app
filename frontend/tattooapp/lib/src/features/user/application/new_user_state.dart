class NewUserState {
  final String? auth0UserId;
  final String? firstName;
  final String? lastName;
  final List<String> stylePreferences;

  const NewUserState({
    this.auth0UserId,
    this.firstName,
    this.lastName,
    this.stylePreferences = const [],
  });

  NewUserState copyWith({
    String? auth0UserId,
    String? firstName,
    String? lastName,
    List<String>? stylePreferences,
  }) {
    return NewUserState(
      auth0UserId: auth0UserId ?? this.auth0UserId,
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
}
