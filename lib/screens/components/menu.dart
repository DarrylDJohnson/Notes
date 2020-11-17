import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/blocs/user/user_cubit.dart';
import 'package:notes/screens/components/user_expansion_tile.dart';
import 'package:notes/themes/app_theme.dart';

menu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: roundedTopShape,
    builder: (_) => Menu(
      userCubit: context.bloc<UserCubit>(),
      noteCubit: context.bloc<NoteCubit>(),
    ),
  );
}

class Menu extends StatelessWidget {
  final UserCubit userCubit;
  final NoteCubit noteCubit;

  const Menu({
    Key key,
    @required this.userCubit,
    @required this.noteCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        UserExpansionTile(userCubit: userCubit,),
        ListTile(
          leading: Icon(MdiIcons.bookOpenPageVariantOutline),
          title: Text("Notes"),
          onTap: () {
            noteCubit.goToList();
            Navigator.of(context).pop(this);
          },
        ),
        ListTile(
          leading: Icon(MdiIcons.plus),
          title: Text("Make a new note"),
          onTap: () {
            noteCubit.goToBottomSheet();
            Navigator.of(context).pop(this);
          },
        ),
        ListTile(
          leading: Icon(MdiIcons.help),
          title: Text("Help & feedback"),
        ),
      ],
    );
  }
}
