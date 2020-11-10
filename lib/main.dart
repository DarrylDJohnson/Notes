import 'package:flutter/material.dart';
import 'package:notes/providers/user_provider.dart';

import 'blocs/simple_bloc_observer.dart';
import 'blocs/user/user_cubit.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserCubit userCubit;

  @override
  void initState() {
    userCubit = UserCubit();
    userCubit.startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserProvider(),
    );
  }
}
