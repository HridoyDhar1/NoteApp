import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/feature/AddNote/presentation/screen/addnote_screen.dart';
import 'package:notes/feature/Auth/presentation/screens/login_screen.dart';
import 'package:notes/feature/Auth/presentation/screens/singup_screen.dart';
import 'package:notes/feature/Auth/presentation/screens/splash_screen.dart';
import 'package:notes/feature/Home/presentation/screen/home_screen.dart';

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => RegisterPage(),
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
}