

part of 'potvrda_bloc.dart';

class PotvrdaState extends Equatable {
   bool potvrda;

   PotvrdaState(
    {required this.potvrda}
    );

  @override
  List<Object> get props => [potvrda];
  


factory PotvrdaState.initial() => PotvrdaState (
  potvrda: true,
);

}
class PotvrdaFalseState extends PotvrdaState{
  PotvrdaFalseState({required super.potvrda});
}

