import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/blocs/user/user_cubit.dart';
import 'package:notes/themes/app_theme.dart';

noteSettings(BuildContext context, Note note) {
  showModalBottomSheet(
    context: context,
    shape: roundedTopShape,
    builder: (_) => Settings(
        userCubit: context.bloc<UserCubit>(),
        noteCubit: context.bloc<NoteCubit>(),
        note: note),
  );
}

class Settings extends StatelessWidget {
  final UserCubit userCubit;
  final NoteCubit noteCubit;
  final Note note;

  const Settings({
    Key key,
    this.userCubit,
    this.noteCubit,
    this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          leading: Icon(null),
          title: Text("Settings"),
        ),
        Divider(
          thickness: 1.5,
        ),
        ListTile(
          leading: Icon(
            MdiIcons.undo,
            color: Colors.black,
          ),
          title: Text("Undo all changes"),
          onTap: () {
            noteCubit.goToNote(note.id);
            Navigator.of(context).pop(this);
          },
        ),
        ListTile(
          leading: Icon(
            MdiIcons.trashCanOutline,
            color: Colors.black,
          ),
          title: Text("Delete note"),
          onTap: () {
            noteCubit.deleteNote(note);
            Navigator.of(context).pop(this);
          },
        ),
      ],
    );
  }
}
