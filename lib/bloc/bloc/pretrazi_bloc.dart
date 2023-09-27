import 'package:bloc/bloc.dart';
import 'package:bloc_learning/models/listaHashtagova.dart';
import 'package:equatable/equatable.dart';

part 'pretrazi_event.dart';
part 'pretrazi_state.dart';

class PretraziBloc extends Bloc<PretraziEvent, PretraziState> {
  final ListaHashtagova listaHashtagova = ListaHashtagova();
  PretraziBloc() : super(PretraziState.initial()) {
    on<PretragaHashtagovaEvent>(_pretragaHashtagovaEvent);
  }

 void  _pretragaHashtagovaEvent(PretragaHashtagovaEvent event, Emitter<PretraziState> emit) async{
    final value = event.value;
    if(value.isEmpty){
      emit(PretraziState(istiStringovi: []));
    }else {
    final List<dynamic> matchingStrings = listaHashtagova.lista
        .where((word) => word.toLowerCase().startsWith(value.toLowerCase()))
        .toList();
        await Future.delayed(Duration(seconds: 2));
        emit(PretraziState(istiStringovi: matchingStrings));
        }
  }
}
 