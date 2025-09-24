import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/env.dart';

class SupabaseManager {
  static final SupabaseClient client = Supabase.instance.client;

  // call this once at app start if not using Supabase.init elsewhere
  static Future<void> init() async {
    await Supabase.initialize(
      url: Env.supabaseUrl,
      anonKey: Env.supabaseAnonKey,
      authCallbackUrlHostname: 'login-callback',
    );
  }
}