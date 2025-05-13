import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/feature/Auth/presentation/controllers/login_controller.dart';


class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        children: [
          TextField(
              onChanged: (val) => controller.email.value = val,
              decoration: InputDecoration(labelText: 'Email')),
          TextField(
              obscureText: true,
              onChanged: (val) => controller.password.value = val,
              decoration: InputDecoration(labelText: 'Password')),
          ElevatedButton(onPressed: controller.login, child: Text("Login")),
          TextButton(
              onPressed: () => Get.toNamed('/register'),
              child: Text("Create Account")),
        ],
      ),
    );
  }
}
