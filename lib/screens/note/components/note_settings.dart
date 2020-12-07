import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/cubits/navigation/navigation_cubit.dart';
import 'package:notes/cubits/note/note_cubit.dart';
import 'package:notes/themes/app_theme.dart';

noteSettings(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: roundedTopShape,
    builder: (_) => Settings(
      context.bloc<NoteCubit>(),
      context.bloc<NavigationCubit>(),
    ),
  );
}

class Settings extends StatelessWidget {
  final NoteCubit noteCubit;
  final NavigationCubit navigationCubit;

  const Settings(this.noteCubit, this.navigationCubit);

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
          title: Text("Undo changes"),
          onTap: () {
            navigationCubit.goToNotebook(noteCubit.notebook);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            MdiIcons.trashCanOutline,
            color: Colors.black,
          ),
          title: Text("Delete note"),
          onTap: () {
            noteCubit.deleteNote();
            navigationCubit.goToNotebook(noteCubit.notebook);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
