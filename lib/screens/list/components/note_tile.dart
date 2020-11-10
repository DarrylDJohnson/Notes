import 'package:flutter/material.dart';
import 'package:notes/blocs/notes/note_cubit.dart';

class NoteTile extends StatelessWidget {
  final Note note;

  const NoteTile({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.title),
      subtitle: Text(
        note.note,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () => context.bloc<NoteCubit>().goToNote(note.id),
    );
  }
}
