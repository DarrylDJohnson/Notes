import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/notebook.dart';
import 'package:notes/screens/notebook/components/note_tile.dart';

class NotesPage extends StatelessWidget {
  final Notebook notebook;
  final List<Note> notes;

  const NotesPage(this.notebook, this.notes);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => NoteTile(notebook, notes[index]),
        itemCount: notes.length,

    );
  }
}
