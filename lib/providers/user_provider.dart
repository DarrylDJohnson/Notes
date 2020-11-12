import 'package:flutter/material.dart';
import 'package:notes/blocs/user/user_cubit.dart';
import 'package:notes/screens/signIn/sign_in_screen.dart';
import 'package:notes/screens/splash/splash_screen.dart';

import 'note_provider.dart';

class UserProvider extends StatefulWidget {
  @override
  _UserProviderState createState() => _UserProviderState();
}

class _UserProviderState extends State<UserProvider> {
  UserCubit userCubit;

  @override
  void initState() {
    userCubit = UserCubit();
    userCubit.startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => userCubit,
      child: BlocConsumer(
        cubit: userCubit,
        listener: (context, state) {
          if (state is UserStateError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text("User Error: ${state.error}"),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UserStateInitial) {
            return SplashScreen();
          } else if (state is UserStateAuthenticated) {
            return NoteProvider(state.user);
          } else {
            return SignInScreen();
          }
        },
      ),
    );
  }
}
