import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneta_note/features/notes/presentation/note_detail_page.dart';
import 'package:moneta_note/features/notes/provider/notes_provider.dart';

class NotesPage extends ConsumerWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesNotifierProvider).value ?? [];

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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    notes[index].title,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    notes[index].description,
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Delete a note'),
                                        content: Text(
                                          'Are sure to delete "${notes[index].title}?"',
                                        ),
                                        actions: [
                                          // Cancel the deleting process
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, 'Cancel');
                                            },
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          // Delete a note
                                          TextButton(
                                            onPressed: () {
                                              ref
                                                  .read(
                                                    notesNotifierProvider
                                                        .notifier,
                                                  )
                                                  .deleteNote(notes[index]);
                                              ref.invalidate(
                                                notesNotifierProvider,
                                              );
                                              Navigator.pop(context, 'Delete');
                                            },
                                            child: Text(
                                              'Delete',
                                              style: TextStyle(
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },

                                  icon: Icon(Icons.delete, color: Colors.red),
                                ),
                              ),
                            ],
                          ),
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
