import 'package:flutter/material.dart';
import 'package:notes/cubits/home/home_cubit.dart';
import 'package:notes/cubits/navigation/navigation_cubit.dart';
import 'package:notes/cubits/notebook/notebook_cubit.dart';
import 'package:notes/models/notebook.dart';
import 'package:notes/screens/components/bottom_bar.dart';
import 'package:notes/screens/components/error_snack_bar.dart';
import 'package:notes/screens/components/menu.dart';
import 'package:notes/screens/notebook/components/settings.dart';

import 'components/note_floating_action_button.dart';
import 'components/notebook_app_bar.dart';
import 'pages/empty_page.dart';
import 'pages/loading_page.dart';
import 'pages/notes_page.dart';

class NotebookScreen extends StatelessWidget {
  final Notebook notebook;

  const NotebookScreen(this.notebook);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<NotebookCubit>().updateNotebook(notebook);
        context.bloc<NavigationCubit>().goToHome();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: CustomScrollView(
            slivers: [
              NotebookAppBar(notebook),
              SliverFillRemaining(
                child: BlocConsumer(
                  cubit: context.bloc<NotebookCubit>(),
                  listener: (context, state) {
                    if (state is NotebookStateError) {
                      showErrorSnackBar(context, state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is NotebookStateLoading) {
                      return LoadingPage();
                    } else if (state is NotebookStateSuccess) {
                      return state.notes.isEmpty
                          ? EmptyPage()
                          : NotesPage(notebook, state.notes);
                    }
                    throw (() {});
                  },
                  buildWhen: (previousState, currentState) =>
                      currentState is NotebookStateLoading ||
                      currentState is NotebookStateSuccess,
                ),
              ),
            ],
          ),
          floatingActionButton: NoteFloatingActionButton(notebook),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomBar(
            showMenu: () => menu(context),
            showSettings: () => notebookSettings(context),
          ),
        ),
      ),
    );
  }
}
