import 'package:flutter/material.dart';
import 'package:notes/cubits/home/home_cubit.dart';
import 'package:notes/screens/home/home_screen.dart';

class HomeProvider extends StatefulWidget {
  @override
  _HomeProviderState createState() => _HomeProviderState();
}

class _HomeProviderState extends State<HomeProvider> {
  HomeCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = HomeCubit();
    cubit.init();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("HomeProvider");
    return BlocProvider<HomeCubit>(
      create: (_) => cubit,
      child: HomeScreen(),
    );
  }
}
