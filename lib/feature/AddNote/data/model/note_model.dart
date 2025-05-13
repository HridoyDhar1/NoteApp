import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String id;
  final String title;
  final String description;
  final DateTime? timestamp;

  NoteModel({
    required this.id,
    required this.title,
    required this.description,
    this.timestamp,
  });

  factory NoteModel.fromFirestore(Map<String, dynamic> json, String docId) {
    return NoteModel(
      id: docId,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      timestamp: (json['timestamp'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'timestamp': timestamp,
      };
}
