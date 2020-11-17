import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateAvatar extends StatelessWidget {
  final DateTime dateTime;

  const DateAvatar({Key key, this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DateFormat(DateFormat.ABBR_MONTH).format(dateTime),
          textAlign: TextAlign.center,
        ),
        Text(
          DateFormat(DateFormat.DAY).format(dateTime),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
