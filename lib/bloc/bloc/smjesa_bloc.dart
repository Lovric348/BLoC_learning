import 'package:bloc/bloc.dart';

part 'smjesa_event.dart';
part 'smjesa_state.dart';

class SmjesaBloc extends Bloc<SmjesaEvent, SmjesaState> {
  SmjesaBloc() : super(SmjesaState.initial()) {
    


  @override
  Stream<SmjesaState> mapEventToState(SmjesaEvent event) async* {
    if (event is HastagSearch) {
      final searchTerm = event.searchTerm.toLowerCase();
      final filteredShops = state.trazi
          .where((shop) =>
              shop.hastag.any((hastag) => hastag.toLowerCase().contains(searchTerm)))
          .toList();

      yield SmjesaState(filteredShops);
    }
  }
  }
}