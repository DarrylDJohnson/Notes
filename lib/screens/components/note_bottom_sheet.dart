import 'package:flutter/material.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/screens/components/title_text_field.dart';
import 'package:notes/themes/app_theme.dart';

showNoteBottomSheet(BuildContext context, Note note) {
  showModalBottomSheet(
    context: context,
    shape: modalBottomSheetShape,
    builder: (_) =>
        NoteBottomSheet(note: note, cubit: context.bloc<NoteCubit>()),
  );
}

class NoteBottomSheet extends StatelessWidget {
  final Note note;
  final NoteCubit cubit;

  const NoteBottomSheet({
    Key key,
    this.note,
    this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        /*
        ListTile(
          title: TitleTextField(note),
        ),
        ListTile(
          title: FlatButton(
            child: Text('create note'),
            onPressed: () => cubit.updateNote(note),
          ),
        ),

         */
      ],
    );
  }
}
