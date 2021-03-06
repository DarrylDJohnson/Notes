import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/cubits/user/user_cubit.dart';

class GoogleSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: FlatButton.icon(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        color: Colors.grey.shade900,
        textColor: Colors.white,
        shape: StadiumBorder(),
        icon: Icon(MdiIcons.google),
        label: Text("Sign in with Google"),
        onPressed: () => context.bloc<UserCubit>().signInWithGoogle(),
      ),
    );
  }
}
