import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/feature/Auth/presentation/controllers/splash_controller.dart';


class SplashPage extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    controller.checkUserStatus();
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
