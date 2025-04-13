import 'package:flutter/material.dart';
import 'package:tattooapp/src/app/presentation/splash_screen.dart';
import 'package:tattooapp/src/app/presentation/welcome_carousel_screen.dart';
import 'package:tattooapp/src/features/session/presentation/dev_login_screen.dart';
import 'package:tattooapp/src/features/user/presentation/name_entry_screen.dart';
import 'package:tattooapp/src/features/user/presentation/user_type_selection_screen.dart';
import 'package:tattooapp/src/features/user/presentation/style_preference_screen.dart';
import 'package:tattooapp/src/features/artist/presentation/artist_profile_entry_screen.dart';
import 'package:tattooapp/src/features/client/presentation/client_profile_entry_screen.dart';
import 'package:tattooapp/src/features/user/presentation/profile_display_screen.dart';
import 'package:tattooapp/src/app/presentation/main_app_shell.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case '/welcome':
      return MaterialPageRoute(builder: (_) => const WelcomeCarouselScreen());

    // dev login and onboarding
    case '/dev-login':
      return MaterialPageRoute(builder: (_) => const DevLoginScreen());
    case '/user/name-entry':
      return MaterialPageRoute(builder: (_) => const NameEntryScreen());
    case '/user/type-selection':
      return MaterialPageRoute(builder: (_) => const UserTypeSelectionScreen());
    case '/user/style-preference':
      return MaterialPageRoute(builder: (_) => const StylePreferenceScreen());
    case '/artist/profile-entry':
      return MaterialPageRoute(
        builder: (_) => const ArtistProfileEntryScreen(),
      );
    case '/client/profile-entry':
      return MaterialPageRoute(
        builder: (_) => const ClientProfileEntryScreen(),
      );

    case '/profile':
      return MaterialPageRoute(builder: (_) => const ProfileDisplayScreen());

    case '/main':
      final initialIndex = args is int ? args : 0;
      return MaterialPageRoute(
        builder: (_) => MainAppShell(initialIndex: initialIndex),
      );

    default:
      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(
              body: Center(child: Text('404 - Page Not Found')),
            ),
      );
  }
}
