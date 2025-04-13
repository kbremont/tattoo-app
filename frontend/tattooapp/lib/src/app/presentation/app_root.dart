import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/core/theme/theme.dart';
import 'package:tattooapp/src/core/utils/app_router.dart';

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
      onGenerateRoute: onGenerateRoute,
      initialRoute: '/',
    );
  }
}
