import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/blocs/notes/note_state.dart';
import 'package:notes/screens/components/note_bottom_sheet.dart';
import 'package:notes/screens/empty/empty_screen.dart';
import 'package:notes/screens/list/list_screen.dart';
import 'package:notes/screens/loading/loading_screen.dart';
import 'package:notes/screens/note/note_screen.dart';

class NoteProvider extends StatefulWidget {
  final User user;

  const NoteProvider(
    this.user, {
    Key key,
  }) : super(key: key);

  @override
  _NoteProviderState createState() => _NoteProviderState();
}

class _NoteProviderState extends State<NoteProvider> {
  NoteCubit noteCubit;

  @override
  void initState() {
    noteCubit = NoteCubit();
    noteCubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => noteCubit,
      child: BlocConsumer(
        cubit: noteCubit,
        listener: (context, state) {
          if (state is NoteStateError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text("Note error: ${state.error}"),
              ),
            );
          } else if (state is NoteStateBottomSheet) {
            showNoteBottomSheet(context, state.note);
          }
        },
        buildWhen: (previous, current) {
          if (current is NoteStateBottomSheet || current is NoteStateError) {
            return false;
          } else {
            return true;
          }
        },
        builder: (context, state) {
          if (state is NoteStateLoading) {
            return LoadingScreen();
          } else if (state is NoteStateEmpty) {
            return EmptyScreen();
          } else if (state is NoteStateNote) {
            return NoteScreen();
          } else {
            return ListScreen();
          }
        },
      ),
    );
  }
}
