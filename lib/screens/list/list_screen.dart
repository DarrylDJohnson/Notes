import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/screens/components/bottom_bar.dart';
import 'package:notes/screens/components/create_floating_action_button.dart';
import 'package:notes/screens/list/pages/empty_page.dart';
import 'package:notes/screens/list/pages/list_page.dart';

class ListScreen extends StatelessWidget {
  final List<Note> notes;

  const ListScreen({
    Key key,
    @required this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: notes.isEmpty ? EmptyPage() : ListPage(notes: notes,),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CreateFloatingActionButton(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
