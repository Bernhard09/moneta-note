import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/note.dart';

final notesNotifierProvider = NotifierProvider<NotesProvider, List<Note>>(
  () => NotesProvider(),
);

class NotesProvider extends Notifier<List<Note>> {
  // initial state
  @override
  List<Note> build() {
    return [];
  }

  // method
  void addNote() {
    final newNote = Note(
      id: DateTime.now().millisecondsSinceEpoch,
      title: 'Unknown Notes',
      content: '',
    );
    state = [...state, newNote];
  }

  void updateNote(int id, String title, String content) {
    state = [
      for (final note in state)
        if (note.id == id)
          note.copyWith(id: id, title: title, content: content)
        else
          note,
    ];
  }
}
