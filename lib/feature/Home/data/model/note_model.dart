
class Note {
  String id;
  String title;
  String description;
  String userId;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
  });

  factory Note.fromMap(Map<String, dynamic> map, String docId) {
    return Note(
      id: docId,
      title: map['title'],
      description: map['description'],
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'userId': userId,
    };
  }
}
