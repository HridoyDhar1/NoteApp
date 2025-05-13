import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/feature/AddNote/data/model/note_model.dart';


class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addNote(String title, String description) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    await _db.collection('notes').add({
      'uid': uid,
      'title': title,
      'description': description,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<List<NoteModel>> getUserNotes() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return _db
        .collection('notes')
        .where('uid', isEqualTo: uid)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => NoteModel.fromFirestore(doc.data(), doc.id))
            .toList());
  }
}
