import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/services/shared_preferences.dart';

import 'notes/note_state.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Cubit cubit, Object event) {
    print(event);
    super.onEvent(cubit, event);
  }

  @override
  void onChange(Cubit cubit, Change change) async {

    print(change);
    if (change.nextState is NoteStateNote) {
      setCurrentId(change.nextState.note.id);
    } else if (change.nextState is NoteStateList){
      setCurrentId(null);
    }

    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}