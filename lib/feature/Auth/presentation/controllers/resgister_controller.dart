import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final name = ''.obs;

  void register() async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.value, password: password.value);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user!.uid)
          .set({'name': name.value, 'email': email.value});

      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar("Register Failed", e.toString());
    }
  }
}
