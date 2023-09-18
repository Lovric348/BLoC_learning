import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/hastag_model.dart';

part 'smjesa_event.dart';
part 'smjesa_state.dart';

class SmjesaBloc extends Bloc<SmjesaEvent, SmjesaState> {
  SmjesaBloc() : super(SmjesaState.initial()) {
    on<HastagSearch>(_hastagSearch);
}

void _hastagSearch(HastagSearch event, Emitter<SmjesaState> emit){}
}