import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tattooapp/src/features/user/user_providers.dart';
import 'package:tattooapp/src/features/auth/auth_providers.dart';
import 'package:tattooapp/src/features/client/client_providers.dart';

class ClientProfileEntryScreen extends ConsumerStatefulWidget {
  const ClientProfileEntryScreen({super.key});

  @override
  ConsumerState<ClientProfileEntryScreen> createState() =>
      _ClientProfileEntryScreenState();
}

class _ClientProfileEntryScreenState
    extends ConsumerState<ClientProfileEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _locationController = TextEditingController();

  void _onContinue() async {
    if (_formKey.currentState?.validate() ?? false) {
      final location = _locationController.text.trim();

      ref
          .read(newClientProfileStateProvider.notifier)
          .update(location: location);

      final clientProfileState = ref.read(newClientProfileStateProvider);
      final userState = ref.read(newUserStateProvider);

      // check if client profile state is complete
      if (!clientProfileState.isComplete) {
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

      await ref
          .read(createUserUseCaseProvider)
          .execute(accessToken: accessToken, user: userState.toUser());
      await ref
          .read(createClientProfileUseCaseProvider)
          .execute(
            accessToken: accessToken,
            client: clientProfileState.toClientProfile(userState.toUser().id),
          );

      if (!mounted) return;
      // navigate to client profile screen
      Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
    } else {
      // show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Location')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Where are you located?',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'City, State',
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        (value == null || value.isEmpty)
                            ? 'Please enter your location'
                            : null,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _onContinue,
                child: const Text('Finish Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
