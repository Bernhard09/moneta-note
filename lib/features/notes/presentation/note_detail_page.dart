import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneta_note/core/theme/app_text_styles.dart';
import 'package:moneta_note/features/notes/data/note.dart';
import 'package:moneta_note/features/notes/provider/notes_provider.dart';

class NoteDetailPage extends ConsumerStatefulWidget {
  const NoteDetailPage({super.key, required this.note});

  final Note note;

  @override
  ConsumerState<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends ConsumerState<NoteDetailPage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // save button
          TextButton(
            onPressed: () {
              ref
                  .read(notesNotifierProvider.notifier)
                  .updateNote(
                    widget.note.id,
                    _titleController.text,
                    _contentController.text,
                  );
            },
            child: Text('Save'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            // title
            TextField(
              controller: _titleController,
              maxLength: 20,
              style: TextStyle(fontSize: AppTextTitle.fontSize),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),

            // content
            TextField(
              controller: _contentController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hint: Text(
                  'Write down your thoughts...',
                  style: TextStyle(fontWeight: FontWeight.w100),
                ),
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
