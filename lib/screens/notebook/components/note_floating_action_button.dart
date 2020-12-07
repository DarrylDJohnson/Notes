import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/models/notebook.dart';
import 'package:notes/screens/notebook/components/create_note.dart';

class NoteFloatingActionButton extends StatelessWidget {
  final Notebook notebook;

  const NoteFloatingActionButton(this.notebook, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.grey.shade900,
      icon: Icon(MdiIcons.pencilOutline),
      label: Text("New note"),
      onPressed: () => showCreateNote(context),
    );
  }
}
