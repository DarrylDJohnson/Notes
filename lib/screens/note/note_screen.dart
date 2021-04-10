import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/cubits/navigation/navigation_cubit.dart';
import 'package:notes/cubits/note/note_cubit.dart';
import 'package:notes/screens/components/borderless_text_field.dart';
import 'package:notes/screens/components/bottom_bar.dart';
import 'package:notes/screens/components/menu.dart';
import 'package:notes/screens/note/components/note_settings.dart';

class NoteScreen extends StatelessWidget {
  final Note note;

  const NoteScreen(this.note);

  @override
  Widget build(BuildContext context) {
    NoteCubit cubit = context.watch<NoteCubit>();
    NavigationCubit navigation = context.watch<NavigationCubit>();

    return WillPopScope(
      onWillPop: () async {
        cubit.updateNote(note);
        navigation.goToNotebook(cubit.notebook);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                MdiIcons.arrowLeft,
                color: Colors.black,
              ),
              onPressed: () {
                cubit.updateNote(note);
                navigation.goToNotebook(cubit.notebook);
              },
            ),
            title: BorderlessTextField.noteTitle(note),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BorderlessTextField.noteNote(note),
                ),
              )
            ],
          ),
          bottomNavigationBar: BottomBar(
            showMenu: () => menu(context),
            showSettings: () => noteSettings(context),
          ),
        ),
      ),
    );
  }
}
