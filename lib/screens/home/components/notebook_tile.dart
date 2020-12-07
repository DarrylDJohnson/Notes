import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/navigation/navigation_cubit.dart';
import 'package:notes/models/notebook.dart';

class NotebookTile extends StatelessWidget {
  final Notebook notebook;

  const NotebookTile(this.notebook, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(
              notebook.title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w300),
            ),
            onTap: () => context.bloc<NavigationCubit>().goToNotebook(notebook),
          ),
        ),
        Divider(color: Colors.black26,),
      ],
    );
  }
}
