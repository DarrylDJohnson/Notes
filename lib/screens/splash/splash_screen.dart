import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).accentColor,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: Colors.white,
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Image.asset(
                  "assets/ic_launcher.png",
                  height: 96.0,
                  width: 96.0,
                ),
                CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
