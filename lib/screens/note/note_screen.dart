import 'package:flutter/material.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/screens/note/components/body.dart';

import 'components/note_bottom_bar.dart';

class NoteScreen extends StatelessWidget {
  final Note note;

  const NoteScreen({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<NoteCubit>().updateNote(note);
        context.bloc<NoteCubit>().goToList();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Body(
            note: note,
          ),
          bottomNavigationBar: NoteBottomBar(note: note),
        ),
      ),
    );
  }
}
