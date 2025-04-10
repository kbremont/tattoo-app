import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/user/user_providers.dart';
import 'package:tattooapp/src/features/user/domain/user.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';

class StylePreferenceScreen extends ConsumerStatefulWidget {
  const StylePreferenceScreen({super.key});

  @override
  ConsumerState<StylePreferenceScreen> createState() =>
      _StylePreferenceScreenState();
}

class _StylePreferenceScreenState extends ConsumerState<StylePreferenceScreen> {
  final Map<TattooStyles, String> _styles = {
    TattooStyles.americanTraditional: 'American Traditional',
    TattooStyles.japaneseTraditional: 'Japanese Traditional',
    TattooStyles.realism: 'Realism',
    TattooStyles.watercolor: 'Watercolor',
  };

  final Set<TattooStyles> _selectedStyles = {};

  void _onContinue() async {
    // update user state with selected styles
    ref
        .read(newUserStateProvider.notifier)
        .updateStylePreferences(_selectedStyles.toList());
    // get user state
    final userState = ref.read(newUserStateProvider);

    // check if user state is complete
    if (!userState.isComplete) {
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

    // check if user is artist
    if (userState.role == UserRole.artist) {
      // navigate to artist profile entry screen
      Navigator.of(context).pushNamed('/artist/profile-entry');
      return;
    } else {
      // create user
      final user = userState.toUser();
      await ref
          .read(createUserUseCaseProvider)
          .execute(accessToken: accessToken, user: user);

      if (!mounted) return;
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil('/profile', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userState = ref.watch(newUserStateProvider);
    final isArtist = userState.role == UserRole.artist;

    final stylesKeys = _styles.keys.toList();

    final title =
        isArtist
            ? 'What styles do you specialize in?'
            : 'What styles are you into?';

    final button = isArtist ? 'Continue' : 'Finish Setup';

    return Scaffold(
      appBar: AppBar(title: const Text('Your Style Preferences')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: stylesKeys.length,
                itemBuilder: (context, index) {
                  final style = stylesKeys[index];
                  final isSelected = _selectedStyles.contains(style);
                  return CheckboxListTile(
                    title: Text(_styles[style]!),
                    value: isSelected,
                    onChanged: (selected) {
                      setState(() {
                        if (selected == true) {
                          _selectedStyles.add(style);
                        } else {
                          _selectedStyles.remove(style);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _selectedStyles.isNotEmpty ? _onContinue : null,
              child: Text(button),
            ),
          ],
        ),
      ),
    );
  }
}
