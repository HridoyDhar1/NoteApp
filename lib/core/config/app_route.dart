import 'package:go_router/go_router.dart';

import 'package:notes/feature/AddNote/presentation/screen/addnote_screen.dart';
import 'package:notes/feature/Auth/presentation/screens/login_screen.dart';
import 'package:notes/feature/Auth/presentation/screens/singup_screen.dart' show RegisterPage;
import 'package:notes/feature/Auth/presentation/screens/splash_screen.dart';
import 'package:notes/feature/Home/presentation/screen/home_screen.dart';
import 'package:go_router/go_router.dart';


class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      // Splash Page: initial load
      GoRoute(
        path: '/',
        builder: (context, state) => SplashPage(),
      ),
      // Login Page
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      // Registration Page
      GoRoute(
        path: '/register',
        builder: (context, state) => RegisterPage(),
      ),
      // Home Page
      GoRoute(
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
      // Add Note Page
      GoRoute(
        path: '/add-note',
        builder: (context, state) => AddNotePage(),
      ),
    ],
  );
}

