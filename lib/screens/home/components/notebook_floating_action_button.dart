import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../components/create_notebook.dart';

class NotebookFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.grey.shade900,
      icon: Icon(MdiIcons.plus),
      label: Text("New notebook"),
      onPressed: () => showCreateNotebook(context),
    );
  }
}
