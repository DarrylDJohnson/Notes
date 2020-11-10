import 'package:flutter/material.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/models/note.dart';

import 'file:///C:/Users/Darry/AndroidStudioProjects/notes/lib/screens/components/title_text_field.dart';

showNoteBottomSheet(BuildContext context, Note note) {
  showModalBottomSheet(
    context: context,
    builder: (_) => NoteBottomSheet(),
  );
}

class NoteBottomSheet extends StatelessWidget {
  final Note note;

  const NoteBottomSheet({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        TitleTextField(note),
        ListTile(
          title: FlatButton(
            child: Text('create note'),
            onPressed: () => context.bloc<NoteCubit>().updateNote(note),
          ),
        ),
      ],
    );
  }
}
