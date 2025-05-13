

import '../model/note_model.dart';

class NoteService {
  static List<Note> notes = [];

  static void addNote(Note note) {
    notes.add(note);
  }

  static List<Note> getNotes() {
    return notes;
  }
}
