// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'appbar_color_cubit.dart';

class AppbarColorState extends Equatable {
  final Color color;

  const AppbarColorState({required this.color});

  factory AppbarColorState.initial() {
    return const AppbarColorState(
      color: Colors.black,
    );
  }

  @override
  List<Object> get props => [color];

  @override
  bool get stringify => true;

  AppbarColorState copyWith({
    Color? color,
  }) {
    return AppbarColorState(
      color: color ?? this.color,
    );
  }
}
