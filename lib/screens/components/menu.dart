import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/cubits/navigation/navigation_cubit.dart';
import 'package:notes/cubits/notebook/notebook_cubit.dart';
import 'package:notes/cubits/user/user_cubit.dart';
import 'package:notes/screens/components/user_expansion_tile.dart';
import 'package:notes/themes/app_theme.dart';

menu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: roundedTopShape,
    builder: (_) => Menu(
      userCubit: context.bloc<UserCubit>(),
      navigationCubit: context.bloc<NavigationCubit>(),
    ),
  );
}

class Menu extends StatelessWidget {
  final UserCubit userCubit;
  final NavigationCubit navigationCubit;

  const Menu({
    this.userCubit,
    this.navigationCubit,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        UserExpansionTile(userCubit),
        ListTile(
          leading: Icon(MdiIcons.homeOutline),
          title: Text("Home"),
          onTap: () {
            navigationCubit.goToHome();
            Navigator.pop(context);
          },
        ),
        Divider(color: Colors.black45),
        ListTile(
          leading: Icon(MdiIcons.plus),
          title: Text("New notebook"),
          onTap: () {
            navigationCubit.goToCreateNotebook();
            Navigator.pop(context);
          },
        ),
        Divider(color: Colors.black45),
      ],
    );
  }
}
