import 'package:get/get.dart';
import 'package:notes/core/services/firestore_service.dart';
import 'package:notes/feature/AddNote/data/model/note_model.dart';


class HomeController extends GetxController {
  final notes = <NoteModel>[].obs;
  final firestoreService = FirestoreService();

  @override
  void onInit() {
    super.onInit();
    firestoreService.getUserNotes().listen((noteList) {
      notes.value = noteList;
    });
  }
}
