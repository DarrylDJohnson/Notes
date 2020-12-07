import 'package:flutter/material.dart';
import 'package:notes/models/notebook.dart';
import 'package:notes/screens/home/components/notebook_tile.dart';

class NotebooksPage extends StatelessWidget {
  final List<Notebook> notebooks;

  const NotebooksPage(this.notebooks, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => NotebookTile(notebooks[index]),
        childCount: notebooks.length,
      ),
    );
  }
}
