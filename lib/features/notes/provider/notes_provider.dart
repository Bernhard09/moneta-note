import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneta_note/services/shared_prefence_service.dart';
import '../data/note.dart';

final notesNotifierProvider = AsyncNotifierProvider<NotesProvider, List<Note>>(
  () => NotesProvider(),
);

class NotesProvider extends AsyncNotifier<List<Note>> {
  // initial state

  final _key = 'notes_key';

  @override
  List<Note> build() {
    String? notesJsonString = SharedPrefencesService.getString(_key);
    if (notesJsonString != null) {
      final List<dynamic> decodedList = jsonDecode(notesJsonString);

      return decodedList.map((item) => Note.fromMap(item)).toList();
    }
    return [];
  }

  // method
  void addNote() async {
    final newNote = Note(
      id: DateTime.now().millisecondsSinceEpoch,
      title: 'Unknown Notes',
      content: '',
    );
    state = AsyncData([...(state.value ?? []), newNote]);

    final List<Map<String, dynamic>> notesAsMap = state.value!
        .map((note) => note.toMap())
        .toList();

    final String jsonString = jsonEncode(notesAsMap);

    await SharedPrefencesService.setString(_key, jsonString);
  }

  void updateNote(int id, String title, String content) async {
    if (state.value != null) {
      final updatedList = state.value!
          .map(
            (note) => note.id == id
                ? note.copyWith(title: title, content: content)
                : note,
          )
          .toList();
      state = AsyncData(updatedList);
      // state = AsyncData([
      //   for (final note in state.value!)
      //     if (note.id == id)
      //       note.copyWith(id: id, title: title, content: content)
      //     else
      //       note,
      // ]);
    } else {
      state = AsyncData([]);
    }

    final List<Map<String, dynamic>> notesAsMap = state.value!
        .map((note) => note.toMap())
        .toList();

    final String jsonString = jsonEncode(notesAsMap);

    await SharedPrefencesService.setString(_key, jsonString);
  }

  void deleteNote(Note note) async {
    if (state.value != null) {
      List<Note> updatedList = state.value!;
      updatedList.remove(note);

      state = AsyncData(updatedList);
    } else {
      state = AsyncData([]);
    }

    final List<Map<String, dynamic>> notesAsMap = state.value!
        .map((note) => note.toMap())
        .toList();

    final String jsonString = jsonEncode(notesAsMap);

    await SharedPrefencesService.setString(_key, jsonString);
  }
}
