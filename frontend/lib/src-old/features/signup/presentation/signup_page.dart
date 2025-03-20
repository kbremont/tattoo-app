// lib/src/features/signup/presentation/signup_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/signup_providers.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _firstName = '';
  String _lastName = '';

  @override
  Widget build(BuildContext context) {
    final signupState = ref.watch(signupNotifierProvider);

    // Listen to changes in the signup state to show notifications.
    ref.listen(signupNotifierProvider, (previous, next) {
      if (next.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signup successful! Welcome ${next.user!.firstName}')),
        );
      }
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signup failed: ${next.error!.message}')),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: signupState.isLoading
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'First Name'),
                      onSaved: (value) => _firstName = value ?? '',
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your first name' : null,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Last Name'),
                      onSaved: (value) => _lastName = value ?? '',
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your last name' : null,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      onSaved: (value) => _email = value ?? '',
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your email' : null,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      onSaved: (value) => _password = value ?? '',
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your password' : null,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Trigger the signup process.
                          ref
                              .read(signupNotifierProvider.notifier)
                              .signup(
                                email: _email,
                                password: _password,
                                firstName: _firstName,
                                lastName: _lastName,
                              );
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
