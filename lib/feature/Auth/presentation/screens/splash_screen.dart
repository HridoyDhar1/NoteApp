import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed('/login');  // Navigate to login after splash
    });

    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
