import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/notebook.dart';
import 'package:notes/themes/app_theme.dart';

class BorderlessTextField extends StatefulWidget {
  final String initial;
  final String hint;
  final TextStyle style;
  final int maxLines;
  final Function(String) onChanged;

  const BorderlessTextField({
    this.initial = '',
    this.hint = '',
    this.style = const TextStyle(),
    this.maxLines,
    this.onChanged,
  });

  factory BorderlessTextField.noteTitle(Note note) {
    return BorderlessTextField(
      initial: note.title,
      hint: "Title",
      style: TextStyle(fontWeight: FontWeight.bold),
      onChanged: (text) => note.title = text,
      maxLines: 1,
    );
  }

  factory BorderlessTextField.noteNote(Note note) {
    return BorderlessTextField(
      initial: note.note,
      hint: "Type your note here",
      onChanged: (text) => note.note = text,
    );
  }

  factory BorderlessTextField.notebook(Notebook notebook) {
    return BorderlessTextField(
      initial: notebook.title,
      hint: "Notebook",
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300,),
      onChanged: (text) => notebook.title = text,
      maxLines: 1,
    );
  }

  @override
  _BorderlessTextFieldState createState() => _BorderlessTextFieldState();
}

class _BorderlessTextFieldState extends State<BorderlessTextField> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initial);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: widget.maxLines,
      style: widget.style,
      textCapitalization: TextCapitalization.sentences,
      decoration: borderlessInputDecoration.copyWith(hintText: widget.hint),
      onChanged: (text) => widget.onChanged(text),
    );
  }
}
