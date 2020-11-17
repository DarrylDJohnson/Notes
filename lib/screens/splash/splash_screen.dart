import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Image.asset(
                'assets/bg_desk.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0.0,
              top: MediaQuery.of(context).size.height / 4,
              right: 0.0,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline3.copyWith(
                    color: Colors.black87,
                  ),
                  children: [
                    TextSpan(
                      text: " Dabble",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: "Notes",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: LinearProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
