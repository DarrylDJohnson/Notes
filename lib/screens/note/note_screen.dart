import 'package:flutter/material.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/models/note.dart';

import '../components/note_text_field.dart';
import '../components/title_text_field.dart';

class NoteScreen extends StatelessWidget {
  final Note note;

  const NoteScreen({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleTextField(
          note,
          onEditingComplete: () => context.bloc<NoteCubit>().updateNote(note),
        ),
        Expanded(
          child: NoteTextField(
            note,
            onEditingComplete: () => context.bloc<NoteCubit>().updateNote(note),
          ),
        ),
      ],
    );
  }
}
