import 'package:flutter/material.dart';
import 'package:notes/cubits/home/home_cubit.dart';
import 'package:notes/screens/components/bottom_bar.dart';
import 'package:notes/screens/components/error_snack_bar.dart';

import 'components/notebook_floating_action_button.dart';
import 'pages/empty_page.dart';
import 'pages/loading_page.dart';
import 'pages/notebooks_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ListTile(
                  title: Text(
                    "My Notebooks",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
            BlocConsumer(
              cubit: context.watch<HomeCubit>(),
              listener: (context, state) {
                if (state is HomeStateError) {
                  showErrorSnackBar(context, state.error);
                }
              },
              builder: (context, state) {
                if (state is HomeStateSuccess) {
                  return state.notebooks.isEmpty
                      ? EmptyPage()
                      : NotebooksPage(state.notebooks);
                } else if (state is HomeStateLoading) {
                  return LoadingPage();
                }

                throw () {};
              },
              buildWhen: (previous, current) =>
                  current is HomeStateLoading || current is HomeStateSuccess,
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: NotebookFloatingActionButton(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
