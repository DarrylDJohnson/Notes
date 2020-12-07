import 'package:flutter/material.dart';
import 'package:notes/cubits/user/user_cubit.dart';
import 'package:notes/providers/navigation_provider.dart';
import 'package:notes/providers/notebook_provider.dart';
import 'package:notes/screens/components/error_snack_bar.dart';
import 'package:notes/screens/signIn/sign_in_screen.dart';
import 'package:notes/screens/splash/splash_screen.dart';

class UserProvider extends StatefulWidget {
  @override
  _UserProviderState createState() => _UserProviderState();
}

class _UserProviderState extends State<UserProvider> {
  UserCubit cubit;

  @override
  void initState() {
    cubit = UserCubit();
    cubit.startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BlocConsumer(
        cubit: cubit,
        listener: (context, state) {
          if (state is UserStateError) {
            showErrorSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is UserStateInitial) {
            return SplashScreen();
          } else if (state is UserStateAuthenticated) {
            return NavigationProvider();
          } else if (state is UserStateUnauthenticated) {
            return SignInScreen();
          }

          throw () {};
        },
        buildWhen: (previous, current) =>
            current is UserStateInitial ||
            current is UserStateAuthenticated ||
            current is UserStateUnauthenticated,
      ),
    );
  }
}
