import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/feature/Auth/presentation/controllers/auth_controller.dart';


class RegistrationPage extends StatelessWidget {
  final AuthController authController = Get.find();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            ElevatedButton(
              onPressed: () async {
                await authController.register(emailController.text, passwordController.text, nameController.text);
                if (authController.isLoggedIn.value) {
                  Get.offNamed('/home');
                }
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
