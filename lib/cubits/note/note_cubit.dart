import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/notebook.dart';
import 'package:notes/services/notebook_firestore.dart';

import 'note_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:notes/models/note.dart';

export 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final NotebookFirestore firestore;
  final Notebook notebook;
  final Note note;

  NoteCubit(this.notebook, this.note)
      : this.firestore = NotebookFirestore(),
        super(NoteStateLoading());

  StreamSubscription<Note> subscription;

  init() {
    subscription = firestore.streamNote(note.notebookId, note.id).listen(
          (note) => emit(NoteStateSuccess(note)),
          onError: (error) => emit(NoteStateError(error)),
        );
  }

  dispose() => subscription.cancel();

  updateNote(Note note) => firestore.updateNote(notebook, note);

  deleteNote() => firestore.deleteNote(notebook, note);
}
