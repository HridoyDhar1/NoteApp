import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection("notes").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No notes available"));
          }
          var notes = snapshot.data!.docs;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              var note = notes[index];
              return ListTile(
                title: Text(note['title']),
                subtitle: Text(note['description']),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add-note'),
        child: Icon(Icons.add),
      ),
    );
  }
}
