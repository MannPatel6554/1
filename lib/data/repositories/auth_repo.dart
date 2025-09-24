import 'package:supabase_flutter/supabase_flutter.dart';
import '../supabase_client.dart';

class AuthRepo {
  final SupabaseClient client = SupabaseManager.client;

  /// sign in with email/password
  Future<AuthResponse> signIn(String email, String password) =>
      client.auth.signInWithPassword(email: email, password: password);

  /// sign up (creates auth user)
  Future<AuthResponse> signUp(String email, String password) =>
      client.auth.signUp(email: email, password: password);

  /// magic link
  Future<void> sendMagicLink(String email) => client.auth.signInWithOtp(email: email);

  Future<void> signOut() => client.auth.signOut();
}