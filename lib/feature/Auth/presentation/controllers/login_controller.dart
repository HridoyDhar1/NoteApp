import 'package:get/get.dart';
import 'package:notes/core/services/auth_service.dart';


class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final authService = AuthService();

  void login() async {
    try {
      await authService.login(email.value, password.value);
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar("Login Error", e.toString());
    }
  }
}
