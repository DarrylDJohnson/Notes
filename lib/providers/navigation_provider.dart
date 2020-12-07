import 'package:flutter/material.dart';
import 'package:notes/cubits/navigation/navigation_cubit.dart';
import 'package:notes/cubits/note/note_cubit.dart';
import 'package:notes/screens/account/account_screen.dart';
import 'package:notes/screens/components/create_notebook.dart';
import 'package:notes/screens/splash/splash_screen.dart';

import 'home_provider.dart';
import 'note_provider.dart';
import 'notebook_provider.dart';

class NavigationProvider extends StatefulWidget {
  @override
  _NavigationProviderState createState() => _NavigationProviderState();
}

class _NavigationProviderState extends State<NavigationProvider> {
  NavigationCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = NavigationCubit();
    cubit.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("NavigationProvider");

    return BlocProvider(
      create: (_) => cubit,
      child: BlocConsumer(
        cubit: cubit,
        listener: (context, state) {
          if (state is NavigationStateCreateNotebook) {
            showCreateNotebook(context);
          }
        },
        builder: (context, state) {
          if (state is NavigationStateSplash) {
            return SplashScreen();
          } else if (state is NavigationStateAccount) {
            return AccountScreen();
          } else if (state is NavigationStateHome) {
            return HomeProvider();
          } else if (state is NavigationStateNotebook) {
            return NotebookProvider(state.notebook);
          } else if (state is NavigationStateNote) {
            return NoteProvider(state.notebook, state.note);
          }
          throw () {};
        },
        buildWhen: (previous, current) =>
            current is NavigationStateSplash ||
            current is NavigationStateAccount ||
            current is NavigationStateHome ||
            current is NavigationStateNotebook ||
            current is NavigationStateNote,
      ),
    );
  }
}
