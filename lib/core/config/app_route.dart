import 'package:go_router/go_router.dart';
import 'package:notes/feature/AddNote/presentation/screen/addnote_screen.dart';
import 'package:notes/feature/Auth/presentation/screens/login_screen.dart';
import 'package:notes/feature/Auth/presentation/screens/singup_screen.dart';
import 'package:notes/feature/Auth/presentation/screens/splash_screen.dart';
import 'package:notes/feature/Home/presentation/screen/home_screen.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(path: '/login', builder: (context, state) => LoginPage()),
      GoRoute(path: '/register', builder: (context, state) => RegistrationPage()),
      GoRoute(path: '/home', builder: (context, state) => HomePage()),
      GoRoute(path: '/add', builder: (context, state) => AddNotePage()),
    ],
  );
}
