part of 'bored_bloc.dart';

abstract class BoredState extends Equatable {
  const BoredState();
  
  
}

class BoredLoadingState extends BoredState {
  @override
  List<Object> get props => [];
  //on će nam biti initial state
}

class BoredLoadedState extends BoredState {

  final String activityName;
  final String activityType;
  final int participants;

  BoredLoadedState(this.activityName, this.activityType, this.participants);

  @override
  List<Object> get props => [activityName, activityType, participants];
  //Ovdje će Equatable odlučiti jesu li ovi objekti equatable
}

