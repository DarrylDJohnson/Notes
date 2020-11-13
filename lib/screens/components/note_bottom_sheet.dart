import 'package:flutter/material.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/screens/components/title_text_field.dart';
import 'package:notes/themes/app_theme.dart';

showNoteBottomSheet(BuildContext context, Note note) {
  showModalBottomSheet(
    context: context,
    shape: modalBottomSheetShape,
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
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16.0),
            ),
            ListTile(
              leading: Icon(null),
              title: TitleTextField(note),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.blue.withOpacity(0.4),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  textColor: Colors.black54,
                  child: Text("Cancel"),
                  onPressed: () => Navigator.of(context).pop(this),
                ),
                FlatButton(
                  textColor: Theme.of(context).accentColor,
                  child: Text("Done"),
                  onPressed: () {
                    cubit.pushNote(note);
                    Navigator.of(context).pop(this);
                  },
                ),
              ],
            ),
          ],
        ),
        Positioned(
          left: 56.0,
          height: 1000,
          child: VerticalDivider(
            thickness: 1.5,
            width: 1.5,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
