import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/note.dart';
import 'package:notes/services/note_repository.dart';
import 'package:notes/services/shared_preferences.dart';

import 'note_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:notes/models/note.dart';

class NoteCubit extends Cubit<NoteState> {
  final NoteRepository noteRepository;

  NoteCubit([NoteRepository noteRepository])
      : this.noteRepository = noteRepository ?? NoteRepository(),
        super(NoteStateLoading());

  /// Navigation ///
  init() async {
    String id = await getCurrentId();
    id == null ? goToList() : goToNote(id);
  }

  goToNote([String id]) async {
    emit(NoteStateLoading());

    try {
      noteRepository
          .streamNote(id)
          .listen((event) => emit(NoteStateNote(event)));
    } catch (e) {
      emit(NoteStateError(e));
    }
  }

  goToList() async {
    emit(NoteStateLoading());

    try {
      noteRepository
          .streamNotes()
          .listen((event) => emit(NoteStateList(event)));
    } catch (e) {
      emit(NoteStateError(e));
    }
  }

  goToBottomSheet([Note note]) => emit(NoteStateBottomSheet(note ?? Note()));

  /// Actions ///

  updateNote(Note note) async {
    await noteRepository.pushNote(note);
  }

  pushNote(Note note) async {
    note.id ??= noteRepository.generateNoteId();

    await noteRepository.pushNote(note);
  }

  deleteNote(Note note) async {
    await noteRepository.deleteNote(note);
    goToList();
  }


}
