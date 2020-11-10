import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/screens/components/bottom_bar.dart';

import 'components/note_text_field.dart';
import 'components/title_text_field.dart';

class NoteScreen extends StatelessWidget {
  final Note note;

  const NoteScreen({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TitleTextField(note: note),
            Expanded(
              child: NoteTextField(note: note),
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
