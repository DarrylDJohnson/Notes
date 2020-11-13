import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/blocs/notes/note_cubit.dart';

class NoteFloatingActionButton extends StatelessWidget {
  final Note note;

  const NoteFloatingActionButton({
    Key key,
    @required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.extended(
          icon: Icon(MdiIcons.undo),
          label: Text("undo"),
          onPressed: () => context.bloc<NoteCubit>().goToNote(note.id),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        FloatingActionButton.extended(
          icon: Icon(MdiIcons.check),
          label: Text("save"),
          onPressed: () => context.bloc<NoteCubit>().updateNote(note),
        )
      ],
    );
  }
}
