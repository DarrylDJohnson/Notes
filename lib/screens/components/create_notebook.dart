import 'package:flutter/material.dart';
import 'package:notes/cubits/home/home_cubit.dart';
import 'package:notes/cubits/navigation/navigation_cubit.dart';
import 'package:notes/themes/app_theme.dart';

showCreateNotebook(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: roundedTopShape,
    builder: (_) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: CreateNotebook(context.bloc<NavigationCubit>()),
    ),
  );
}

class CreateNotebook extends StatefulWidget {
  final NavigationCubit cubit;

  CreateNotebook(this.cubit, {Key key}) : super(key: key);

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
            textCapitalization: TextCapitalization.sentences,
            decoration:
                borderlessInputDecoration.copyWith(hintText: 'notebook'),
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
                widget.cubit.createNotebook(
                  Notebook(title: controller.text),
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
