part of 'potvrda_bloc.dart';


abstract class PotvrdaEvent extends Equatable{}

class ProvjeriUnos extends PotvrdaEvent {
  final String prviInputString;
  final String drugiInputString;
  final String treciInputString;

  ProvjeriUnos({
    required this.prviInputString,
    required this.drugiInputString,
    required this.treciInputString,
  });

  @override
  List<Object?> get props =>
      [prviInputString, drugiInputString, treciInputString];
}
