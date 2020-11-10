import 'package:flutter/material.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/themes/app_theme.dart';

class TitleTextField extends StatefulWidget {
  final Note note;

  const TitleTextField({
    Key key,
    this.note,
  }) : super(key: key);

  @override
  _TitleTextFieldState createState() => _TitleTextFieldState();
}

class _TitleTextFieldState extends State<TitleTextField> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.note.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: borderlessInputDecoration..copyWith(hintText: "Title"),
      onChanged: (text) => widget.note.title = text,
      onEditingComplete: () =>
          context.bloc<NoteCubit>().updateNote(widget.note),
    );
  }
}