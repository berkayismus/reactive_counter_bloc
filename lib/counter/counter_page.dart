import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/appbar_color_cubit.dart';
import '../cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<AppbarColorCubit>().state.color,
        title: const Text('Reactive Counter With Bloc'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AppbarColorCubit>().changeColor();
              },
              icon: const Icon(Icons.color_lens)),
        ],
      ),
      body: _buildContent(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterCubit>().increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final counter = context.watch<CounterCubit>().state.counter;
    return Center(
      child: Text(
        '$counter',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
