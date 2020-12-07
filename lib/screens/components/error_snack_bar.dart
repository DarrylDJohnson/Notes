import 'package:flutter/material.dart';

showErrorSnackBar(BuildContext context, error) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Error: $error"),
    ),
  );
}
