import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// import '../../providers/auth_providers.dart'; // Commented out for demo mode

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
    // Demo mode - no need for auth repository
    // final repo = ref.read(authRepoProvider);
    
    return Scaffold(
      backgroundColor: Colors.grey.shade900, // Dark background for white text
      appBar: AppBar(title: const Text('CampusERP Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 80, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              'Welcome to CampusERP',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _email, 
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              )
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _password, 
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ), 
              obscureText: true
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _loading
                    ? null
                    : () async {
                        setState(() => _loading = true);
                        
                        // Demo login - simulate authentication
                        await Future.delayed(const Duration(seconds: 1));
                        
                        // Navigate based on demo email
                        if (_email.text.contains('student')) {
                          context.go('/student');
                        } else if (_email.text.contains('faculty')) {
                          context.go('/faculty');
                        } else if (_email.text.contains('admin')) {
                          context.go('/admin');
                        } else if (_email.text.contains('warden')) {
                          context.go('/warden');
                        } else {
                          // Default to student dashboard
                          context.go('/student');
                        }
                        
                        setState(() => _loading = false);
                      },
                child: _loading 
                    ? const CircularProgressIndicator(color: Colors.white) 
                    : const Text('Login', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? ", style: TextStyle(color: Colors.white)),
                TextButton(
                  onPressed: () => context.go('/signup'),
                  child: const Text(
                    'Sign up here',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            const Text(
              'Demo Users:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Column(
              children: [
                Text('• student@demo.com - Student Dashboard', style: TextStyle(color: Colors.white)),
                Text('• faculty@demo.com - Faculty Dashboard', style: TextStyle(color: Colors.white)),
                Text('• admin@demo.com - Admin Dashboard', style: TextStyle(color: Colors.white)),
                Text('• warden@demo.com - Warden Dashboard', style: TextStyle(color: Colors.white)),
              ],
            ),
          ]
        ),
      ),
    );
  }
}