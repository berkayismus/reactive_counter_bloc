import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/counter_page.dart';
import 'cubit/appbar_color_cubit.dart';
import 'cubit/counter_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppbarColorCubit(),
        ),
        BlocProvider(
          create: (context) =>
              CounterCubit(appbarColorCubit: context.read<AppbarColorCubit>()),
        ),
      ],
      child: const MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: CounterPage(),
      ),
    );
  }
}
