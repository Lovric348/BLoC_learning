import 'package:bloc/bloc.dart';
import 'package:bloc_learning/service/bored_service.dart';
import 'package:equatable/equatable.dart';

part 'bored_event.dart';
part 'bored_state.dart';

class BoredBloc extends Bloc<BoredEvent, BoredState> {

  final BoredService _boredList;

  BoredBloc(this._boredList) : super(BoredLoadingState()) {// add form field parameters to get (this._boredList)
    on<BoredEvent>((event, emit) async {
      final activity = await _boredList.getBoredActivity();
      emit(BoredLoadedState(activity.activity, activity.type, activity.participants));
      
    });
  }
}
