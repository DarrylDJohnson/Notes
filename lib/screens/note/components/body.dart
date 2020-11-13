import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/screens/components/note_text_field.dart';
import 'package:notes/screens/components/title_text_field.dart';

class Body extends StatelessWidget {
  final Note note;

  const Body({
    Key key,
    @required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 86.0),
              child: TitleTextField(
                note,
                onEditingComplete: (text) => note.title = text,
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.blue.withOpacity(0.3),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 86.0),
                child: NoteTextField(
                  note,
                  onEditingComplete: (text) => note.note = text,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 0.0,
          left: 64.0,
          bottom: 0.0,
          child: VerticalDivider(
            color: Colors.red,
            thickness: 1.5,
            width: 1.5,
          ),
        ),
        Positioned(
          left: 0.0,
          top: 0.0,
          child: IconButton(
            icon: Icon(MdiIcons.arrowLeft),
            onPressed: () {
              context.bloc<NoteCubit>().updateNote(note);
              context.bloc<NoteCubit>().goToList();
            },
          ),
        ),
      ],
    );
  }
}
