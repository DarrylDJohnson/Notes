import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/blocs/notes/note_cubit.dart';

class NoteTile extends StatelessWidget {
  final Note note;

  const NoteTile({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(note.id),
      confirmDismiss: (direction) async {
        SnackBarClosedReason reason = await Scaffold.of(context)
            .showSnackBar(
              SnackBar(
                content: Text("Deleted ${note.title}"),
                action: SnackBarAction(
                  label: "Undo",
                  onPressed: () {},
                ),
              ),
            )
            .closed
            .then((value) => value);

        return reason != SnackBarClosedReason.action;
      },
      onDismissed: (direction) {
        context.bloc<NoteCubit>().deleteNote(note);
      },
      child: ListTile(
        title: Text(note.title ?? ''),
        subtitle: note.note == null
            ? null
            : Text(
                note.note,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
        trailing: Icon(MdiIcons.chevronRight),
        onTap: () => context.bloc<NoteCubit>().goToNote(note.id),
      ),
      background: ListTile(
        tileColor: Colors.grey.shade900,
        trailing: Icon(
          MdiIcons.trashCanOutline,
          color: Colors.white,
        ),
      ),
    );
  }
}
