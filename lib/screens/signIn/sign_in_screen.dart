import 'package:flutter/material.dart';

import 'components/google_sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 16.0,
              right: 16.0,
              top: 72.0,
              child: FlutterLogo(),
            ),
            Positioned(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
              child: GoogleSignInButton(),
            ),
          ],
        ),
      ),
    );
  }
}
