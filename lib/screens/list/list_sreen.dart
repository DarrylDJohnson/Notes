import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/screens/components/bottom_bar.dart';

import 'components/note_tile.dart';

class ListScreen extends StatelessWidget {
  final List<Note> notes;

  const ListScreen({
    Key key,
    this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            return NoteTile(note: notes[index]);
          },
          itemCount: notes.length,
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
