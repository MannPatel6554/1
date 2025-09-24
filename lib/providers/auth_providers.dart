import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
// import 'package:supabase_flutter/supabase_flutter.dart'; // Commented out for demo
// import '../data/supabase_client.dart'; // Commented out for demo
// import '../data/repositories/auth_repo.dart'; // Commented out for demo
import '../data/models/user_role.dart';

// Demo providers - no Supabase dependency
// final supabaseProvider = riverpod.Provider((ref) => SupabaseManager.client);
// final authRepoProvider = riverpod.Provider((ref) => AuthRepo());

// Demo session provider - always returns null (no active session)
final sessionProvider = riverpod.StreamProvider<dynamic>((ref) {
  return Stream.value(null);
});

// Demo user role provider - always returns null
final userRoleProvider = riverpod.FutureProvider<UserRole?>((ref) async {
  return null;
});
