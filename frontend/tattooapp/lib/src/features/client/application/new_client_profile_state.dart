import 'package:tattooapp/src/features/client/domain/client_profile.dart';

class NewClientProfileState {
  final String? location;

  const NewClientProfileState({this.location});

  NewClientProfileState copyWith({String? location}) {
    return NewClientProfileState(location: location ?? this.location);
  }

  bool get isComplete => location != null;

  ClientProfile toClientProfile(String userId) {
    return ClientProfile(userId: userId, location: location!);
  }
}
