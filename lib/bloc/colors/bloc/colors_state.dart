part of 'colors_bloc.dart';



class ColorsState extends Equatable {
  final Color color;
  final int number;
  final Color colorTitle;
  

  const ColorsState(
    {required this.color, required this.number, required this.colorTitle}
    
    );

  factory ColorsState.initial() => ColorsState(
    number: 0,
    color: Colors.white,
    colorTitle: Colors.blue
    );
  @override
  List<Object> get props => [color];

  @override
  bool get stringify => true;

  ColorsState copyWith({
    Color? color,
    int? number,
    Color? colorTitle,
  }) {
    return ColorsState(
      color: color ?? this.color,
      number: number ?? this.number,
      colorTitle: colorTitle ?? this.colorTitle,
    );
  }



}
