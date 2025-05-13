class NoteModel {
  final String id;
  final String title;
  final String description;
  final String userId;

  NoteModel({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
  });

  factory NoteModel.fromMap(Map<String, dynamic> map, String id) {
    return NoteModel(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      userId: map['userId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'title': title,
    'description': description,
    'userId': userId,
  };
}