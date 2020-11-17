import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/screens/list/components/note_tile.dart';

class ListPage extends StatelessWidget {
  final List<Note> notes;

  const ListPage({Key key, this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.black87,
          forceElevated: true,
          centerTitle: true,
          title: Text(
            "NOTES",
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => NoteTile(note: notes[index]),
            childCount: notes.length,
          ),
        ),
      ],
    );
  }
}
