import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/blocs/notes/note_cubit.dart';

class CreateFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(MdiIcons.pencilOutline),
      label: Text("Make a note"),
      backgroundColor: Colors.amberAccent,
      onPressed: () => context.bloc<NoteCubit>().goToBottomSheet(),
    );
  }
}
