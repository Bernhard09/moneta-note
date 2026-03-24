class Note {
  int id;
  String title;
  String content;
  String? description;

  Note({required this.id, required this.title, required this.content});

  Note copyWith({int? id, String? title, String? content}) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }
}
