import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddNotePage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Note")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: "Title")),
            TextField(controller: descriptionController, decoration: InputDecoration(labelText: "Description")),
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance.collection("notes").add({
                  'title': titleController.text,
                  'description': descriptionController.text,
                });
                Get.back();
              },
              child: Text("Save Note"),
            ),
          ],
        ),
      ),
    );
  }
}
