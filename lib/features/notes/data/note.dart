import 'dart:convert';

class Note {
  int id;
  String title;
  String content;

  String get description {
    try {
      return content.substring(0, 50);
    } catch (e) {
      return content;
    }
  }

  Note({required this.id, required this.title, required this.content});

  Note copyWith({String? title, String? content}) {
    return Note(
      id: id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  // convert to Map
  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'content': content,
  };

  // to JSON
  String toJson() => jsonEncode(toMap());

  // convert Map to Object
  factory Note.fromMap(Map<String, dynamic> map) =>
      Note(id: map['id'], title: map['title'], content: map['content']);

  // convert direct from JSON string
  factory Note.fromJson(String source) => Note.fromMap(jsonDecode(source));
}
