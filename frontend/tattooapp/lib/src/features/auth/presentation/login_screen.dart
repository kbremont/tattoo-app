import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginUseCase = ref.watch(loginUseCaseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await loginUseCase.execute();
            if (context.mounted) {
              Navigator.of(context).pushReplacementNamed('/profile');
            }
          },
          child: const Text('Log In with Auth0'),
        ),
      ),
    );
  }
}
