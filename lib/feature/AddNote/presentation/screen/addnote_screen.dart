import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/feature/Home/presentation/controller/note_controller.dart';

class AddNotePage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final NotesController notesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Note")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              maxLines: 5,
              decoration: InputDecoration(labelText: "Description"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await notesController.addNote(
                  titleController.text.trim(),
                  descriptionController.text.trim(),
                );
                Get.back(); // Return to HomePage
              },
              child: Text("Save Note"),
            )
          ],
        ),
      ),
    );
  }
}
