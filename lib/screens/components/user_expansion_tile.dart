import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/cubits/user/user_cubit.dart';

class UserExpansionTile extends StatelessWidget {
  final UserCubit userCubit;

  const UserExpansionTile(
    this.userCubit,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Material(
        clipBehavior: Clip.hardEdge,
        shape: CircleBorder(),
        child: Image.network(
          userCubit.user.photoURL,
          height: 36.0,
          width: 36.0,
        ),
      ),
      title: Text("${userCubit.user.displayName}"),
      trailing: IconButton(
        icon: Icon(MdiIcons.logout),
        onPressed: () {
          userCubit.signOut();
          Navigator.of(context)?.pop(this);
        },
      ),
    );
  }
}
