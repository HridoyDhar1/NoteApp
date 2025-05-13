import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/feature/AddNote/presentation/screen/addnote_screen.dart';
import 'package:notes/feature/Auth/presentation/controllers/auth_controller.dart';
import 'package:notes/feature/Auth/presentation/screens/login_screen.dart';
import 'package:notes/feature/Auth/presentation/screens/singup_screen.dart';
import 'package:notes/feature/Auth/presentation/screens/splash_screen.dart';
import 'package:notes/feature/Home/presentation/screen/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  final authController = Get.put(AuthController());

  runApp(MyApp(authController: authController));
}

class MyApp extends StatelessWidget {
  final AuthController authController;

  MyApp({required this.authController});

  // Define the GoRouter
  final GoRouter _router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => RegistrationPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/add-note',
        builder: (context, state) => AddNotePage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router( // Use MaterialApp.router for GoRouter
      title: 'Notes App',
      routerConfig: _router,  // Use routerConfig here
    );
  }
}
