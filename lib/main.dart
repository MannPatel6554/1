import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
// import 'data/supabase_client.dart'; // Commented out for demo mode

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Supabase (commented out for demo mode)
  // await SupabaseManager.init();
  
  // Run app inside ProviderScope for Riverpod
  runApp(const ProviderScope(child: CampusApp()));
}