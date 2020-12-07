import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'menu.dart';

class BottomBar extends StatelessWidget {
  final Function showSettings;
  final Function showMenu;

  const BottomBar({
    this.showSettings,
    this.showMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(MdiIcons.menu),
              onPressed: () => menu(context),
            ),
            Visibility(
              visible: showSettings != null,
              child: IconButton(
                icon: Icon(MdiIcons.dotsVertical),
                onPressed: () => showSettings(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
