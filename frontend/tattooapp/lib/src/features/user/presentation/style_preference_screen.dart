import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/user/user_providers.dart';

class StylePreferenceScreen extends ConsumerStatefulWidget {
  const StylePreferenceScreen({super.key});

  @override
  ConsumerState<StylePreferenceScreen> createState() =>
      _StylePreferenceScreenState();
}

class _StylePreferenceScreenState extends ConsumerState<StylePreferenceScreen> {
  final List<String> _styles = [
    'Traditional',
    'Neo-traditional',
    'Blackwork',
    'Japanese',
    'Realism',
    'Minimalist',
  ];

  final Set<String> _selectedStyles = {};

  void _onContinue() {
    // update user state with selected styles
    ref
        .read(newUserStateProvider.notifier)
        .updateStylePreferences(_selectedStyles.toList());
    // get user state
    final userState = ref.read(newUserStateProvider);
    // create user
    ref.read(createUserUseCaseProvider).execute(userState);
    Navigator.of(context).pushReplacementNamed('/profile');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Style Preferences')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'What styles are you into?',
              style: theme.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: _styles.length,
                itemBuilder: (context, index) {
                  final style = _styles[index];
                  final isSelected = _selectedStyles.contains(style);
                  return CheckboxListTile(
                    title: Text(style),
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
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
