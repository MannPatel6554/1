import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/auth_providers.dart';
import 'features/auth/login_screen.dart';
import 'features/student/dashboard_screen.dart';
import 'features/faculty/dashboard_screen.dart' as faculty;
import 'features/admin/dashboard_screen.dart' as admin;
import 'features/warden/dashboard_screen.dart' as warden;

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (c, s) => const SplashRedirect()),
    GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
    GoRoute(path: '/student', builder: (c, s) => const StudentDashboardScreen()),
    GoRoute(path: '/faculty', builder: (c, s) => const faculty.FacultyDashboard()),
    GoRoute(path: '/admin', builder: (c, s) => const admin.AdminDashboard()),
    GoRoute(path: '/warden', builder: (c, s) => const warden.WardenDashboard()),
  ],
);

class SplashRedirect extends ConsumerWidget {
  const SplashRedirect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // very simple flow: check auth & role, redirect
    final session = ref.watch(sessionProvider);
    return session.when(
      data: (s) {
        if (s == null) return const LoginScreen();
        // user logged in -> fetch role
        ref.read(userRoleProvider.future).then((role) {
          if (role == null) return; // fallback
          switch (role) {
            case UserRole.student:
              context.go('/student');
              break;
            case UserRole.faculty:
              context.go('/faculty');
              break;
            case UserRole.admin:
              context.go('/admin');
              break;
            case UserRole.warden:
              context.go('/warden');
              break;
          }
        });
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, st) => Scaffold(body: Center(child: Text('Error: $e'))),
    );
  }
}