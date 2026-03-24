import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneta_note/core/theme/app_text_styles.dart';
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
  int _selectedIndex = 0;

  final Map<String, Widget> _children = {
    'Notes': NotesPage(),
    'Search': SearchPage(),
    'Profile': ProfilePage(),
  };

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _children.keys.toList(growable: false)[_selectedIndex],
          style: TextStyle(
            fontSize: AppTextTitle.fontSize,
            fontWeight: AppTextTitle.fontWeight,
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _onDestinationSelected,
        selectedIndex: _selectedIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.note),
            icon: Icon(Icons.note_outlined),
            label: 'Note',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: _children.values.toList(growable: false)[_selectedIndex],
      floatingActionButton: (_selectedIndex == 0)
          ? FloatingActionButton(
              onPressed: () {
                ref.read(notesNotifierProvider.notifier).addNote();
              },
              tooltip: 'Add',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
