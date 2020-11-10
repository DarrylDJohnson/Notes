import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/blocs/user/user_state.dart';
import 'package:notes/services/user_repository.dart';

export 'package:flutter_bloc/flutter_bloc.dart';
export 'user_state.dart';


class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit()
      : userRepository = UserRepository(),
        super(UserStateInitial());

  Future<void> startApp() async {
    emit(UserStateInitial());

    UserStatus userStatus = await userRepository.getUserStatus();

    switch (userStatus) {
      case UserStatus.unknown:
        emit(UserStateUnauthenticated());
        break;
      case UserStatus.authenticated:
        User user = userRepository.getUser();
        emit(UserStateAuthenticated(user));
        break;
      default:
        emit(UserStateUnauthenticated());
    }
  }

  Future<void> signInWithGoogle() async {
    emit(UserStateLoading());

    User user = await userRepository.signInWithGoogle();

    user != null
        ? emit(UserStateAuthenticated(user))
        : emit(UserStateError('Google sign in error'));
  }

  Future<void> signOut() async {
    emit(UserStateLoading());

    User user = await userRepository.signOutWithGoogle();

    user == null ? startApp() : UserStateAuthenticated(user);
  }

  User getCurrentUser() {
    return userRepository.getUser();
  }
}
