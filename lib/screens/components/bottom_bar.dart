import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/screens/components/settings.dart';

import 'menu.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(MdiIcons.menu),
          onPressed: () => menu(context),
        ),
        IconButton(
          icon: Icon(MdiIcons.dotsVertical),
          onPressed: () => settings(context),
        ),
      ],
    );
  }
}