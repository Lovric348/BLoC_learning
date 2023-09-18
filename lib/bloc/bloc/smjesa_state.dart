part of 'smjesa_bloc.dart';

abstract class SmjesaState {
  final List<Hastag> hastags = [];

  factory SmjesaState.initial() => SmjesaState(
    hastags: 
  )
  @override
  List<Object> get props => [hastags];

  SmjesaState copyWith({
    Hastag? hastag,
  }) {
    return SmjesaState(
      hastags: hastag ?? this.hastags,
    );
  }
   

}