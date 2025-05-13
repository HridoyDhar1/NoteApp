import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/feature/Home/presentation/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Notes")),
      body: Obx(() {
        if (controller.notes.isEmpty) {
          return Center(child: Text("No notes found."));
        }
        return ListView.builder(
          itemCount: controller.notes.length,
          itemBuilder: (context, index) {
            final note = controller.notes[index];
            return ListTile(
              title: Text(note.title),
              subtitle: Text(note.description),
              trailing: Text(note.timestamp?.toString() ?? ''),
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
