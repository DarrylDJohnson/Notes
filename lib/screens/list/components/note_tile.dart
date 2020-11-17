import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/blocs/notes/note_cubit.dart';

class NoteTile extends StatelessWidget {
  final Note note;

  const NoteTile({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        color: Colors.white,
        elevation: 4.0,
        child: ListTile(
          title: Text(
            note.title.toUpperCase() ?? '',
            style: TextStyle(),
          ),
          subtitle: Text(
            note.note ?? 'Empty',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(MdiIcons.chevronRight),
          onTap: () => context.bloc<NoteCubit>().goToNote(note.id),
        ),
      ),
    );
  }
}
