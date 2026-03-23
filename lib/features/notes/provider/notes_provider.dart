import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/note.dart';

final noteNotifierProvider = NotifierProvider<NotesProvider, List<Note>>(
  () => NotesProvider(),
);

class NotesProvider extends Notifier<List<Note>> {
  // initial state
  @override
  List<Note> build() {
    return [
      Note(id: 1, title: 'Catatan Satu', content: 'awewo nice'),
      Note(id: 2, title: 'Catatan Dua', content: 'awewo nice'),
    ];
  }
  // method

  void addNote() {
    final newNote = Note(id: 99, title: 'New Note', content: 'Awewoeo');
    state = [...state, newNote];
  }
}
