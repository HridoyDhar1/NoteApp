import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/feature/Auth/presentation/controllers/auth_controller.dart';
import 'package:notes/feature/Home/presentation/controller/note_controller.dart';

class HomePage extends StatelessWidget {
  final NotesController notesController = Get.put(NotesController());
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => authController.logout(),
          ),
        ],
      ),
      body: Obx(() {
        if (notesController.notes.isEmpty) {
          return Center(child: Text("No notes yet."));
        }
        return ListView.builder(
          itemCount: notesController.notes.length,
          itemBuilder: (context, index) {
            final note = notesController.notes[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(note.title),
                subtitle: Text(note.description),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => notesController.deleteNote(note.id),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add-note'),
        child: Icon(Icons.add),
      ),
    );
  }
}
