import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/blocs/user/user_cubit.dart';

class UserExpansionTile extends StatelessWidget {
  final UserCubit userCubit;

  const UserExpansionTile({
    Key key,
    this.userCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User currentUser = userCubit.getCurrentUser();
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        leading: Material(
          clipBehavior: Clip.hardEdge,
          shape: CircleBorder(),
          child: Image.network(
            currentUser.photoURL,
            height: 36.0,
            width: 36.0,
          ),
        ),
        title: Text("${currentUser.displayName}"),
        children: [
          ListTile(
            leading: Icon(null),
            title: Text("Sign out"),
            onTap: () {
              userCubit.signOut();
              Navigator.of(context).pop(this);
            },
          ),
        ],
      ),
    );
  }
}
