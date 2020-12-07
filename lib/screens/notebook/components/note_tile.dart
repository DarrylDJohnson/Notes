import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/cubits/navigation/navigation_cubit.dart';
import 'package:notes/cubits/notebook/notebook_cubit.dart';
import 'package:notes/models/note.dart';

class NoteTile extends StatelessWidget {
  final Notebook notebook;
  final Note note;

  const NoteTile(this.notebook, this.note, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotebookCubit cubit = context.bloc<NotebookCubit>();
    NavigationCubit navigationCubit = context.bloc<NavigationCubit>();

    return Dismissible(
      key: Key(note.id),
      confirmDismiss: (direction) async {
        SnackBarClosedReason reason = await ScaffoldMessenger.of(context)
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
      onDismissed: (direction) => cubit.deleteNote(note),
      child: ListTile(
        title: Text(
          note.title ?? '',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          note.note ?? 'Empty',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () => context.bloc<NavigationCubit>().goToNote(notebook, note),
      ),
      background: ListTile(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        tileColor: Colors.grey.shade900,
        trailing: Icon(
          MdiIcons.trashCanOutline,
          color: Colors.white,
        ),
      ),
    );
  }
}
