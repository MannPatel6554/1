import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Run app inside ProviderScope for Riverpod
  runApp(const ProviderScope(child: CampusApp()));
}