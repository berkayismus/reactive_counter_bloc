import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'appbar_color_state.dart';

class AppbarColorCubit extends Cubit<AppbarColorState> {
  AppbarColorCubit() : super(AppbarColorState.initial());

  void changeColor() {
    if (state.color == Colors.black) {
      emit(
        state.copyWith(color: Colors.red),
      );
    } else {
      emit(
        state.copyWith(color: Colors.black),
      );
    }
  }
}
