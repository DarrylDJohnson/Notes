import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/blocs/user/user_cubit.dart';

class GoogleSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: FlatButton.icon(
        icon: Icon(MdiIcons.google),
        label: Text("Sign in with Google"),
        onPressed: () => context.bloc<UserCubit>().signInWithGoogle(),
      ),
    );
  }
}
