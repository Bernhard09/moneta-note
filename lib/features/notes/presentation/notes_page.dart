import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneta_note/core/theme/app_colors.dart';
import 'package:moneta_note/features/notes/presentation/note_detail_page.dart';
import 'package:moneta_note/features/notes/provider/notes_provider.dart';

class NotesPage extends ConsumerWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesNotifierProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: (notes.isEmpty)
                ? Center(
                    child: Text(
                      'There are nothing here, add one!',
                      style: TextStyle(fontWeight: FontWeight.w100),
                    ),
                  )
                : ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NoteDetailPage(note: notes[index]),
                          ),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 32.0,
                          ),
                          child: Row(children: [Text(notes[index].title)]),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
