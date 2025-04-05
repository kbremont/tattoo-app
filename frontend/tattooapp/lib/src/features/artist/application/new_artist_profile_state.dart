import 'package:tattooapp/src/features/artist/domain/artist_profile.dart';

class NewArtistProfileState {
  final String? bio;
  final String? location;
  final String? tattooShop;

  const NewArtistProfileState({this.bio, this.location, this.tattooShop});

  NewArtistProfileState copyWith({
    String? bio,
    String? location,
    String? tattooShop,
  }) {
    return NewArtistProfileState(
      bio: bio ?? this.bio,
      location: location ?? this.location,
      tattooShop: tattooShop ?? this.tattooShop,
    );
  }

  bool get isComplete => bio != null && location != null;

  ArtistProfile toArtistProfile(String userId) {
    return ArtistProfile(
      userId: userId,
      bio: bio!,
      location: location!,
      tattooShop: tattooShop!,
    );
  }
}
