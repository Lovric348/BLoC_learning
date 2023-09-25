import 'package:bloc/bloc.dart';
import 'package:bloc_learning/models/listaHashtagova.dart';
import 'package:equatable/equatable.dart';

part 'trazi_state.dart';

class TraziCubit extends Cubit<List<String>> {
  final ListaHashtagova listaHashtagova;
  
  TraziCubit(this.listaHashtagova) : super([]);

void traziStringove(String query){
  final List<String> istiStringovi = listaHashtagova.listaHashtagova
  .where((word) => word.toLowerCase().contains(query.toLowerCase()))
  .toList();
  emit(istiStringovi);
}
}
