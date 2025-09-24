import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final repo = ref.read(authRepoProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(controller: _email, decoration: const InputDecoration(labelText: 'Email')),
          TextField(controller: _password, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _loading
                ? null
                : () async {
                    setState(() => _loading = true);
                    try {
                      final res = await repo.signIn(_email.text.trim(), _password.text.trim());
                      if (res.session != null) {
                        // signed in; GoRouter splash will redirect
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Check credentials or confirm email')));
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login error: $e')));
                    } finally {
                      setState(() => _loading = false);
                    }
                  },
            child: _loading ? const CircularProgressIndicator() : const Text('Login'),
          ),
          TextButton(onPressed: () => repo.sendMagicLink(_email.text.trim()), child: const Text('Send Magic Link')),
        ]),
      ),
    );
  }
}