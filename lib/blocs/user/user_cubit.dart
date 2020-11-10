import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/blocs/user/user_state.dart';
import 'package:notes/services/user_repository.dart';

export 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;

  UserCubit(this._userRepository) : super(Initial());

  Future<void> startApp() async {
    emit(Initial());

    UserStatus userStatus = await _userRepository.getUserStatus();

    switch (userStatus) {
      case UserStatus.unknown:
        emit(Unauthenticated());
        break;
      case UserStatus.authenticated:
        User user = _userRepository.getUser();
        emit(Authenticated(user));
        break;
      default:
        emit(Unauthenticated());
    }
  }

  Future<void> signInWithGoogle() async {
    emit(Loading());

    User user = await _userRepository.signInWithGoogle();

    user != null
        ? emit(Authenticated(user))
        : emit(UserError('Google sign in error'));
  }

  Future<void> signOut() async {
    emit(Loading());

    User user = await _userRepository.signOutWithGoogle();

    user == null ? startApp() : Authenticated(user);
  }

  User getCurrentUser() {
    return _userRepository.getUser();
  }
}