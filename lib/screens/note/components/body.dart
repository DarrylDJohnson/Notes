import 'package:flutter/material.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/screens/components/note_text_field.dart';

class Body extends StatelessWidget {
  final Note note;

  const Body({
    Key key,
    @required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: NoteTextField(
              note,
              onEditingComplete: (text) => note.note = text,
            ),
          ),
        ),
      ],
    );
  }
}
