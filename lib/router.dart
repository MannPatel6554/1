import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/auth_providers.dart';
import 'data/models/user_role.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/signup_screen.dart';
import 'features/landing/landing_screen.dart';
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
    GoRoute(path: '/landing', builder: (c, s) => const LandingScreen()),
    GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
    GoRoute(path: '/signup', builder: (c, s) => const SignupScreen()),
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
    // Demo mode - show landing page first
    // Remove this and uncomment below for full Supabase integration
    return const LandingScreen();
    
    // Full Supabase integration (commented out for demo)
    /*
    final session = ref.watch(sessionProvider);
    final userRole = ref.watch(userRoleProvider);
    
    return session.when(
      data: (s) {
        if (s == null) return const LoginScreen();
        
        // User is logged in, check role
        return userRole.when(
          data: (role) {
            // Use WidgetsBinding to navigate after build
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (role != null) {
                _navigateBasedOnRole(context, role);
              }
            });
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          },
          loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
          error: (e, st) => const LoginScreen(),
        );
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, st) => Scaffold(body: Center(child: Text('Error: $e'))),
    );
    */
  }
  
  void _navigateBasedOnRole(BuildContext context, UserRole role) {
    String route;
    if (role == UserRole.student) {
      route = '/student';
    } else if (role == UserRole.faculty) {
      route = '/faculty';
    } else if (role == UserRole.admin) {
      route = '/admin';
    } else if (role == UserRole.warden) {
      route = '/warden';
    } else {
      route = '/login';
    }
    context.go(route);
  }
}