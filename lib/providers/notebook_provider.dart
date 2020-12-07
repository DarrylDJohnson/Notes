import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notebook/notebook_cubit.dart';
import 'package:notes/screens/notebook/notebook_screen.dart';

class NotebookProvider extends StatefulWidget {
  final Notebook notebook;

  const NotebookProvider(this.notebook, {Key key}) : super(key: key);

  @override
  _NotebookProviderState createState() => _NotebookProviderState();
}

class _NotebookProviderState extends State<NotebookProvider> {
  NotebookCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = NotebookCubit(widget.notebook);
    cubit.init();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("NotebookProvider");

    return BlocProvider(
      create: (_) => cubit,
      child: NotebookScreen(widget.notebook),
    );
  }
}
