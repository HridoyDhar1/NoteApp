import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      isLoggedIn.value = true;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> register(String email, String password, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      // You can save the name in Firestore here
      isLoggedIn.value = true;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    isLoggedIn.value = false;
  }
}
