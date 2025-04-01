// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'dart:async';

// class SplashScreen extends ConsumerStatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   ConsumerState<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends ConsumerState<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 2), () {
//       // Navigate to welcome screen
//       Navigator.of(context).pushReplacementNamed('/welcome');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Icon(
//             //   Icons.brush,
//             //   size: 80,
//             //   color: Theme.of(context).colorScheme.primary,
//             // ),
//             Lottie.asset(
//               'assets/animations/splash_screen.json',
//               width: 120,
//               height: 120,
//               repeat: true,
//             ),
//             const SizedBox(height: 16),
//             Text('InkLink', style: Theme.of(context).textTheme.titleLarge),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Lottie.asset(
          'assets/animations/splash_screen.json',
          fit: BoxFit.cover,
          repeat: true,
        ),
      ),
    );
  }
}
