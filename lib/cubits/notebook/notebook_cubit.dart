import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/notebook.dart';
import 'package:notes/services/notebook_firestore.dart';

import 'notebook_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:notes/models/note.dart';
export 'package:notes/models/notebook.dart';

export 'notebook_state.dart';

class NotebookCubit extends Cubit<NotebookState> {
  final NotebookFirestore firestore;
  final Notebook notebook;

  NotebookCubit(this.notebook)
      : this.firestore = NotebookFirestore(),
        super(NotebookStateLoading());

  StreamSubscription<List<Note>> subscription;

  init() {
    subscription = firestore.streamNotes(notebook.id).listen(
          (notes) => emit(NotebookStateSuccess(notes)),
          onError: (error) => emit(NotebookStateError(error)),
        );
  }

  dispose() => subscription.cancel();

  updateNotebook(Notebook notebook) async =>
      await firestore.updateNotebook(notebook);

  deleteNotebook() async => await firestore.deleteNotebook(notebook);

  deleteNote(Note note) async => await firestore.deleteNote(notebook, note);

  /// Streams ///
  Stream<List<Note>> streamNotes() => firestore.streamNotes(notebook.id);
}
