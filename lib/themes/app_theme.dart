import 'package:flutter/material.dart';

ShapeBorder roundedTopShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(8.0),
  ),
);

ShapeBorder roundedShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(8.0),
  ),
);

ShapeBorder roundedBorderedShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(8.0),
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
