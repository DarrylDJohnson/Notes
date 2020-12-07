import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/cubits/navigation/navigation_cubit.dart';
import 'package:notes/cubits/notebook/notebook_cubit.dart';
import 'package:notes/themes/app_theme.dart';

notebookSettings(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: roundedTopShape,
    builder: (_) => Settings(
      notebookCubit: context.bloc<NotebookCubit>(),
      navigationCubit: context.bloc<NavigationCubit>(),
    ),
  );
}

class Settings extends StatelessWidget {
  final NotebookCubit notebookCubit;
  final NavigationCubit navigationCubit;

  const Settings({
    Key key,
    @required this.notebookCubit,
    @required this.navigationCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text("Settings"),
        ),
        Divider(),
        ListTile(
          leading: Icon(MdiIcons.trashCanOutline),
          title: Text("Delete notebook"),
          onTap: () {
            notebookCubit.deleteNotebook();
            navigationCubit.goToHome();
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
