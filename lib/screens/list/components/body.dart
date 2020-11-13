import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';

import 'note_tile.dart';

class Body extends StatelessWidget {
  final List<Note> notes;

  const Body({
    Key key,
    @required this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 1.5,
          color: Colors.blue.withOpacity(0.3),
        );
      },
      itemBuilder: (context, index) {
        print("XYZ ${notes.length}");
        return NoteTile(note: notes[index]);
      },
      itemCount: notes.length,
    );
  }
}
