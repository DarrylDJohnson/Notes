import 'package:flutter/material.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/blocs/user/user_cubit.dart';
import 'package:notes/themes/app_theme.dart';

settings(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: roundedTopShape,
    builder: (_) => Settings(
      userCubit: context.bloc<UserCubit>(),
      noteCubit: context.bloc<NoteCubit>(),
    ),
  );
}

class Settings extends StatelessWidget {
  final UserCubit userCubit;
  final NoteCubit noteCubit;

  const Settings({
    Key key,
    this.userCubit,
    this.noteCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [],
    );
  }
}
