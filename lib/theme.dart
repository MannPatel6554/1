import 'package:flutter/material.dart';

final Color primaryColor = const Color(0xFF1565C0);

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, brightness: Brightness.light),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, brightness: Brightness.dark),
);