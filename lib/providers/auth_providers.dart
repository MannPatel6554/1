import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:supabase_flutter/supabase_flutter.dart';


import '../data/supabase_client.dart';
import '../data/repositories/auth_repo.dart';
import '../data/models/user_role.dart';

// Supabase client provider
final supabaseProvider = riverpod.Provider((ref) => SupabaseManager.client);

// Authentication repository provider
final authRepoProvider = riverpod.Provider((ref) => AuthRepo());

// Session provider (listen to auth state changes)
final sessionProvider = riverpod.StreamProvider<Session?>((ref) {
  final client = ref.watch(supabaseProvider);
  return client.auth.onAuthStateChange.map((e) => e.session);
});

// User role provider (fetch role from "users" table)
final userRoleProvider = riverpod.FutureProvider<UserRole?>((ref) async {
  final client = ref.watch(supabaseProvider);
  final user = client.auth.currentUser;
  if (user == null) return null;

  final r = await client
      .from('users')
      .select('role')
      .eq('id', user.id)
      .maybeSingle();

  if (r == null) return null;
  return roleFromString(r['role'] as String?);
});
