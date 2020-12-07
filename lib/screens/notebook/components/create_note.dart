import 'package:flutter/material.dart';
import 'package:notes/cubits/home/home_cubit.dart';
import 'package:notes/cubits/navigation/navigation_cubit.dart';
import 'package:notes/cubits/notebook/notebook_cubit.dart';
import 'package:notes/themes/app_theme.dart';

showCreateNote(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: roundedTopShape,
    builder: (_) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: CreateNotebook(
          context.bloc<NotebookCubit>(), context.bloc<NavigationCubit>()),
    ),
  );
}

class CreateNotebook extends StatefulWidget {
  final NotebookCubit notebookCubit;
  final NavigationCubit navigationCubit;

  const CreateNotebook(
    this.notebookCubit,
    this.navigationCubit, {
    Key key,
  }) : super(key: key);

  @override
  _CreateNotebookState createState() => _CreateNotebookState();
}

class _CreateNotebookState extends State<CreateNotebook> {
  TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: controller,
            decoration: borderlessInputDecoration.copyWith(hintText: 'note'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              textColor: Colors.black45,
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
              textColor: Colors.black,
              child: Text("Done"),
              onPressed: () {
                widget.navigationCubit.createNote(
                  widget.notebookCubit.notebook,
                  Note(title: controller.text),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
