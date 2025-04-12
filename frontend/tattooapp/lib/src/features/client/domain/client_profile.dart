import 'package:tattooapp/gen/dart/tattooapp/client/v1/client_profile.pb.dart'
    as proto;

class ClientProfile {
  final String userId;
  final String location;

  const ClientProfile({required this.userId, required this.location});

  factory ClientProfile.fromProto(proto.ClientProfile client) {
    return ClientProfile(userId: client.userId, location: client.location);
  }
}

extension ClientProfileMapper on ClientProfile {
  proto.ClientProfile toProto() {
    return proto.ClientProfile(userId: userId, location: location);
  }
}
