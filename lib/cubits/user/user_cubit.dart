import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/user/user_state.dart';
import 'package:notes/services/user_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit()
      : this.userRepository = UserRepository(),
        super(UserStateInitial());

  User get user => FirebaseAuth.instance.currentUser;

  Future<void> startApp() async {
    emit(UserStateInitial());

    try {
      userRepository.streamUserState().listen((user) async {
        if (user == null) {
          emit(UserStateUnauthenticated());
        } else {
          emit(UserStateAuthenticated(user));
        }
      });
    } catch (error) {
      addError(error);
      emit(UserStateError(error));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(UserStateLoading());

    try {
      await userRepository.signInWithGoogle();
    } catch (error) {
      addError(error);
      emit(UserStateError(error));
    }
  }

  Future<void> signOut() async {
    emit(UserStateLoading());

    try {
      await userRepository.signOutWithGoogle();
    } catch (error) {
      addError(error);
      emit(UserStateError(error));
    }
  }
}
