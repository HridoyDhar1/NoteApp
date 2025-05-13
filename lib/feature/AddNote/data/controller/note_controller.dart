import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddNoteController extends GetxController {
  final title = ''.obs;
  final description = ''.obs;

  void saveNote() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('notes').add({
      'uid': uid,
      'title': title.value,
      'description': description.value,
      'timestamp': FieldValue.serverTimestamp(),
    });
    Get.back();
  }
}
