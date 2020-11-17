import 'package:flutter/material.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/screens/components/title_text_field.dart';
import 'package:notes/themes/app_theme.dart';

showNoteBottomSheet(BuildContext context, Note note) {
  showModalBottomSheet(
    context: context,
    shape: roundedTopShape,
    builder: (_) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: NoteBottomSheet(
        note: note,
        cubit: context.bloc<NoteCubit>(),
      ),
    ),
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
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        ListTile(
          title: TitleTextField(note),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              textColor: Colors.black45,
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(this),
            ),
            FlatButton(
              textColor: Colors.black,
              child: Text("Done"),
              onPressed: () {
                cubit.pushNote(note);
                Navigator.of(context).pop(this);
              },
            ),
          ],
        ),
      ],
    );
  }
}
