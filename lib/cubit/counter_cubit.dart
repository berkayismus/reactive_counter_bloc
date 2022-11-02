import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'appbar_color_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  late StreamSubscription<AppbarColorState> appColorSub;

  CounterCubit({
    required AppbarColorCubit appbarColorCubit,
  }) : super(CounterState.initial()) {
    appColorSub = appbarColorCubit.stream.listen((appbarColorState) {
      if (appbarColorState.color == Colors.black) {
        emit(state.copyWith(
          incrementSize: 10,
        ));
      } else {
        emit(state.copyWith(
          incrementSize: 50,
        ));
      }
    });
  }

  void increment() {
    emit(state.copyWith(
      counter: state.counter + state.incrementSize,
    ));
  }

  @override
  Future<void> close() {
    appColorSub.cancel();
    return super.close();
  }
}
