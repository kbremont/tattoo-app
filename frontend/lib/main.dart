// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import '../api/proto/gen/dart/user_service.connect.client.dart';
// import 'gen/dart/tattooapp/v1/user_service.connect.client.dart';
// import 'src-old/features/signup/presentation/signup_page.dart';

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Signup App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const SignupPage(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/features/auth/presentation/welcome_page.dart';
import 'src/features/auth/presentation/login_page.dart';
import 'src/features/auth/presentation/signup_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
      },
    );
  }
}
