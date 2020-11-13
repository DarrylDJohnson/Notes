import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/models/note.dart';
import 'package:notes/screens/components/menu.dart';
import 'package:notes/screens/note/components/note_settings.dart';

class NoteBottomBar extends StatelessWidget {
  final Note note;

  const NoteBottomBar({
    Key key,
    @required this.note,
  }) : super(key: key);

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
            IconButton(
              icon: Icon(MdiIcons.dotsVertical),
              onPressed: () => noteSettings(context, note),
            ),
          ],
        ),
      ),
    );
  }
}
