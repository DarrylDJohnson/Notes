import 'package:flutter/material.dart';

ShapeBorder modalBottomSheetShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(8.0),
  ),
);

InputDecoration borderlessInputDecoration = InputDecoration(
  border: InputBorder.none,
  enabledBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  focusedErrorBorder: InputBorder.none,
);