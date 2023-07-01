part of 'bored_bloc.dart';

abstract class BoredEvent extends Equatable {
  const BoredEvent();

  @override
  List<Object> get props => [];
}
class LoadAPIEvent extends BoredEvent {}