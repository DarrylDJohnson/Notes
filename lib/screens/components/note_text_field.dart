import 'package:flutter/material.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/models/note.dart';
import 'package:notes/themes/app_theme.dart';

class NoteTextField extends StatefulWidget {
  final Note note;
  final Function onEditingComplete;

  const NoteTextField(
    this.note, {
    this.onEditingComplete,
    Key key,
  }) : super(key: key);

  @override
  _NoteTextFieldState createState() => _NoteTextFieldState();
}

class _NoteTextFieldState extends State<NoteTextField> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.note.note);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: borderlessInputDecoration
        ..copyWith(hintText: "Type your note here"),
      onChanged: (text) => widget.note.note = text,
      onEditingComplete: () => widget.onEditingComplete,
    );
  }
}
