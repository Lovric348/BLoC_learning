import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'potvrda_event.dart';
part 'potvrda_state.dart';

class PotvrdaBloc extends Bloc<PotvrdaEvent, PotvrdaState> {
  PotvrdaBloc() : super(PotvrdaState.initial())

   {on<ProvjeriUnos>(_provjeriPotvrdu);}
  }

  void _provjeriPotvrdu(ProvjeriUnos event, Emitter<PotvrdaState> emit) {
    bool prviBool = event.prviInputString == 'Josip'; 
    bool drugiBool = event.drugiInputString == 'Lovric';
    bool treciBool = event.treciInputString == 'palac';

    bool newPotvrdaValue = prviBool && drugiBool && treciBool;

    emit(PotvrdaState(potvrda: newPotvrdaValue));
  }


