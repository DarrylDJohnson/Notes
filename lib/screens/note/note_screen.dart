import 'package:flutter/material.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/screens/components/bottom_bar.dart';
import 'package:notes/screens/note/components/body.dart';

class NoteScreen extends StatelessWidget {
  final Note note;

  const NoteScreen({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(note: note,),
        floatingActionButton: NoteFloatingActionButton(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
