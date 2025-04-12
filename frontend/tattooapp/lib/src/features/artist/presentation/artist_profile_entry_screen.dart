import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/artist/artist_providers.dart';
import 'package:tattooapp/src/features/user/user_providers.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';

class ArtistProfileEntryScreen extends ConsumerStatefulWidget {
  const ArtistProfileEntryScreen({super.key});

  @override
  ConsumerState<ArtistProfileEntryScreen> createState() =>
      _ArtistProfileEntryScreenState();
}

class _ArtistProfileEntryScreenState
    extends ConsumerState<ArtistProfileEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _bioController = TextEditingController();
  final _locationController = TextEditingController();
  final _tattooShopController = TextEditingController();

  @override
  void dispose() {
    _bioController.dispose();
    _locationController.dispose();
    _tattooShopController.dispose();
    super.dispose();
  }

  void _onContinue() async {
    if (_formKey.currentState?.validate() ?? false) {
      final bio = _bioController.text.trim();
      final location = _locationController.text.trim();
      final tattooShop = _tattooShopController.text.trim();

      ref
          .read(newArtistProfileStateProvider.notifier)
          .update(bio: bio, location: location, tattooShop: tattooShop);

      // get artist profile state
      final artistProfileState = ref.read(newArtistProfileStateProvider);
      // get user state
      final userState = ref.read(newUserStateProvider);

      // check if artist profile state is complete
      if (!artistProfileState.isComplete) {
        // show error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please complete all fields')),
        );
        return;
      }

      // get access token
      final accessToken = ref.read(accessTokenProvider);
      if (accessToken == null) {
        // show error message
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Please login again')));
        return;
      }

      await ref
          .read(createUserUseCaseProvider)
          .execute(accessToken: accessToken, user: userState.toUser());
      await ref
          .read(createArtistProfileUseCaseProvider)
          .execute(
            accessToken: accessToken,
            artist: artistProfileState.toArtistProfile(userState.toUser().id),
          );

      if (!mounted) return;
      // navigate to artist profile screen
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil('/profile', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Artist Profile')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Tell us more about yourself as an artist.',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _bioController,
                decoration: const InputDecoration(labelText: 'Short Bio'),
                maxLines: 3,
                validator:
                    (value) =>
                        (value == null || value.isEmpty)
                            ? 'Bio is required'
                            : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Location'),
                validator:
                    (value) =>
                        (value == null || value.isEmpty)
                            ? 'Location is required'
                            : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tattooShopController,
                decoration: const InputDecoration(
                  labelText: 'Tattoo Shop (optional)',
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _onContinue,
                child: const Text('Finish Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
