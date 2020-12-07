import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/notebook.dart';
import 'package:notes/services/notebook_firestore.dart';

import 'navigation_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:notes/models/note.dart';
export 'package:notes/models/notebook.dart';

export 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final NotebookFirestore firestore;

  NavigationCubit()
      : this.firestore = NotebookFirestore(),
        super(NavigationStateSplash());

  init() async {
    print("NavigationCubit: init");
    await firestore.initialize();

    goToHome();
  }

  goToSplash() => emit(NavigationStateSplash());

  goToAccount() => emit(NavigationStateAccount());

  goToHome() => emit(NavigationStateHome());

  goToNotebook(Notebook notebook) => emit(NavigationStateNotebook(notebook));

  goToNote(Notebook notebook, Note note) =>
      emit(NavigationStateNote(notebook, note));

  goToCreateNotebook() => emit(NavigationStateCreateNotebook());

  /// Actions
  createNotebook(Notebook notebook) async {
    notebook.id ??= await firestore.createNotebook(notebook);

    emit(NavigationStateNotebook(notebook));
  }

  createNote(Notebook notebook, Note note) async {
    note.id ??= await firestore.createNote(notebook, note);

    emit(NavigationStateNote(notebook, note));
  }
}
