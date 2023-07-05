part of 'colors_bloc.dart';


abstract class ColorsEvent extends Equatable {
  const ColorsEvent();
  @override
  List<Object> get props => [];
}


class ColorChangeEvent extends ColorsEvent {}
class ResetEvent extends ColorsEvent {}
class DecreaseEvent extends ColorsEvent {}
class NextPageEvent extends ColorsEvent {}
class SeriousPageEvent extends ColorsEvent {}