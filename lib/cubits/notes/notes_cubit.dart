import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/notebook.dart';
import 'package:notes/services/note_firestore.dart';

import 'notes_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:notes/models/note.dart';

export 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final NoteFirestore firestore;
  final Notebook notebook;

  NotesCubit(this.notebook)
      : this.firestore = NoteFirestore(notebook),
        super(NotesStateLoading());

  StreamSubscription<List<Note>> _notes;

  init() {
    _notes = firestore.streamNotes().listen(
          (notes) => emit(NotesStateSuccess(notes)),
          onError: (error) => emit(NotesStateError(error)),
        );
  }

  dispose() => _notes.cancel();

  goToNote(Note note) => emit(NotesStateNote(note));

  update(Note note) async => await firestore.updateNote(note);

  delete(Note note) async => await firestore.deleteNote(note);
}
