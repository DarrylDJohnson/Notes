import 'package:flutter/material.dart';
import 'package:notes/cubits/note/note_cubit.dart';
import 'package:notes/models/notebook.dart';
import 'package:notes/screens/note/note_screen.dart';

class NoteProvider extends StatefulWidget {
  final Notebook notebook;
  final Note note;

  const NoteProvider(this.notebook, this.note);

  @override
  _NoteProviderState createState() {
    return _NoteProviderState();
  }
}

class _NoteProviderState extends State<NoteProvider> {
  NoteCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = NoteCubit(widget.notebook, widget.note);
    cubit.init();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: NoteScreen(cubit.note),
    );
  }
}
