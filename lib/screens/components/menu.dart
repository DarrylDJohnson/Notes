import 'package:flutter/material.dart';
import 'package:notes/blocs/notes/note_cubit.dart';
import 'package:notes/blocs/user/user_cubit.dart';
import 'package:notes/themes/app_theme.dart';

menu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: modalBottomSheetShape,
    builder: (_) => Menu(
      userCubit: context.bloc<UserCubit>(),
      noteCubit: context.bloc<NoteCubit>(),
    ),
  );
}

class Menu extends StatelessWidget {
  final UserCubit userCubit;
  final NoteCubit noteCubit;

  const Menu({
    Key key,
    @required this.userCubit,
    @required this.noteCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [],
    );
  }
}
