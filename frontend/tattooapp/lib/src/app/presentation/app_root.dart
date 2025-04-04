import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/core/theme/theme.dart';
import 'package:tattooapp/src/app/presentation/splash_screen.dart';
import 'package:tattooapp/src/features/user/presentation/profile_screen.dart';
import 'package:tattooapp/src/features/onboarding/presentation/welcome_carousel_screen.dart';
import 'package:tattooapp/src/features/user/presentation/name_entry_screen.dart';
import 'package:tattooapp/src/features/user/presentation/user_type_selection_screen.dart';
import 'package:tattooapp/src/features/user/presentation/style_preference_screen.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

class AppRoot extends ConsumerWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Tattoo App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeCarouselScreen(),
        '/user/name-entry': (_) => const NameEntryScreen(),
        '/user/type-selection': (_) => const UserTypeSelectionScreen(),
        '/user/style-preference': (_) => const StylePreferenceScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
