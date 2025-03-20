// lib/src/features/login/presentation/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/login_providers.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginNotifierProvider);

    // Listen to state changes to show notifications.
    ref.listen(loginNotifierProvider, (previous, next) {
      if (next.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful! Welcome ${next.user!.firstName}')),
        );
      }
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${next.error!.message}')),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: loginState.isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    // Email & Password Login Form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Email'),
                            onSaved: (value) => _email = value ?? '',
                            validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            onSaved: (value) => _password = value ?? '',
                            validator: (value) => value!.isEmpty ? 'Please enter your password' : null,
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                ref
                                    .read(loginNotifierProvider.notifier)
                                    .loginWithEmail(email: _email, password: _password);
                              }
                            },
                            child: Text('Login with Email'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    // Google Login Button
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          final googleUser = await _googleSignIn.signIn();
                          if (googleUser == null) return; // User cancelled sign-in.
                          final googleAuth = await googleUser.authentication;
                          final googleToken = googleAuth.idToken;
                          if (googleToken != null) {
                            ref
                                .read(loginNotifierProvider.notifier)
                                .loginWithGoogle(googleToken: googleToken);
                          }
                        } catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Google Sign-In failed: $error')),
                          );
                        }
                      },
                      child: Text('Login with Google'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
