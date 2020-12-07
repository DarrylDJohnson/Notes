import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/models/notebook.dart';
import 'package:notes/services/notebook_firestore.dart';

import 'home_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:notes/models/notebook.dart';

export 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final NotebookFirestore firestore;

  StreamSubscription<List<Notebook>> subscription;

  HomeCubit()
      : this.firestore = NotebookFirestore(),
        super(HomeStateLoading());

  /// Navigation ///
  init() {
    subscription = firestore.streamNotebooks().listen(
          (notebooks) => emit(HomeStateSuccess(notebooks)),
          onError: (error) => emit(HomeStateError(error)),
        );
  }

  dispose() {
    subscription.cancel();
  }
}
