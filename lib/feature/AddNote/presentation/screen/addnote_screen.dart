import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes/feature/AddNote/data/controller/note_controller.dart';

class AddNotePage extends StatelessWidget {
  final controller = Get.put(AddNoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Note")),
      body: Column(
        children: [
          TextField(onChanged: (val) => controller.title.value = val),
          TextField(onChanged: (val) => controller.description.value = val),
          ElevatedButton(onPressed: controller.saveNote, child: Text("Save"))
        ],
      ),
    );
  }
}
