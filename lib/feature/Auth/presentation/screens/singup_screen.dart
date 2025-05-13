import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/feature/Auth/presentation/controllers/resgister_controller.dart';

class RegisterPage extends StatelessWidget {
  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Column(
        children: [
          TextField(onChanged: (val) => controller.name.value = val),
          TextField(onChanged: (val) => controller.email.value = val),
          TextField(
              obscureText: true,
              onChanged: (val) => controller.password.value = val),
          ElevatedButton(
              onPressed: controller.register, child: Text("Register")),
        ],
      ),
    );
  }
}
