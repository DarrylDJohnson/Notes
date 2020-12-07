import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/cubits/navigation/navigation_cubit.dart';
import 'package:notes/cubits/notebook/notebook_cubit.dart';
import 'package:notes/models/notebook.dart';
import 'package:notes/screens/components/borderless_text_field.dart';

class NotebookAppBar extends StatelessWidget {
  final Notebook notebook;

  const NotebookAppBar(this.notebook);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      textTheme: Theme.of(context).textTheme,
      iconTheme: Theme.of(context).iconTheme,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(MdiIcons.arrowLeft),
        onPressed: () {
          context.bloc<NotebookCubit>().updateNotebook(notebook);
          context.bloc<NavigationCubit>().goToHome();
        },
      ),
      title: BorderlessTextField.notebook(notebook),
    );
  }
}
