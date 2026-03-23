import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneta_note/features/notes/provider/notes_provider.dart';
import 'package:moneta_note/features/search/presentation/search_page.dart';

import 'features/notes/presentation/notes_page.dart';
import 'features/profile/presentation/profile_page.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int _counter = 0;
  int _currentIndex = 0;

  final Map<String, Widget> _children = {
    'Notes': NotesPage(),
    'Search': SearchPage(),
    'Profile': ProfilePage(),
  };

  void _onTapBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(_children.keys.toList(growable: false)[_currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapBarTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Note'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: _children.values.toList(growable: false)[_currentIndex],
      floatingActionButton: (_currentIndex == 0)
          ? FloatingActionButton(
              onPressed: () {
                ref.read(noteNotifierProvider.notifier).addNote();
              },
              tooltip: 'Add',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
