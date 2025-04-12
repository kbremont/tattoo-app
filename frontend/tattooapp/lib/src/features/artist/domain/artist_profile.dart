import 'package:tattooapp/gen/dart/tattooapp/artist/v1/artist_profile.pb.dart'
    as proto;

class ArtistProfile {
  final String userId;
  final String bio;
  final String location;
  final String tattooShop;

  const ArtistProfile({
    required this.userId,
    required this.bio,
    required this.location,
    required this.tattooShop,
  });

  factory ArtistProfile.fromProto(proto.ArtistProfile artist) {
    return ArtistProfile(
      userId: artist.userId,
      bio: artist.bio,
      location: artist.location,
      tattooShop: artist.tattooShop,
    );
  }
}

extension ArtistProfileMapper on ArtistProfile {
  proto.ArtistProfile toProto() {
    return proto.ArtistProfile(
      userId: userId,
      bio: bio,
      location: location,
      tattooShop: tattooShop,
    );
  }
}
