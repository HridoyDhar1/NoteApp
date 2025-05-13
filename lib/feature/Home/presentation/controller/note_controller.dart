import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:notes/feature/Home/data/model/note_model.dart';

class NotesController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxList<NoteModel> notes = <NoteModel>[].obs;

  Future<void> addNote(String title, String description) async {
    try {
      String uid = _auth.currentUser!.uid;
      await _firestore.collection('notes').add({
        'title': title,
        'description': description,
        'userId': uid,
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Fetch Notes by User
  void fetchNotes() {
    String uid = _auth.currentUser!.uid;
    _firestore
        .collection('notes')
        .where('userId', isEqualTo: uid)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      notes.value = snapshot.docs.map((doc) {
        return NoteModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
