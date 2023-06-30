part of 'colors_bloc.dart';



class ColorsState extends Equatable {
  final Color color;
  final int number;

  const ColorsState(
    {required this.color, required this.number}
    
    );

  factory ColorsState.initial() => ColorsState(
    number: 0,
    color: Colors.pink,
    );
  @override
  List<Object> get props => [color];

  @override
  bool get stringify => true;

  ColorsState copyWith({
    Color? color,
    int? number,
  }) {
    return ColorsState(
      color: color ?? this.color,
      number: number ?? this.number,
    );
  }



}
