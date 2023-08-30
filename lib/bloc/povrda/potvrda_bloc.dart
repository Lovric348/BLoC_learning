import 'package:bloc/bloc.dart';

part 'potvrda_event.dart';
part 'potvrda_state.dart';

class PotvrdaBloc extends Bloc<PotvrdaEvent, PotvrdaState> {
  PotvrdaBloc() : super(PotvrdaState.initial()){

   on<EmailEvent>(_emailEvent);
   on<PasswordEvent>(_passwordEvent);

  }

  void _emailEvent(EmailEvent event, Emitter<PotvrdaState> emit) {
    print('my email is ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<PotvrdaState> emit) {
    print('my password is ${event.password}');
    emit(state.copyWith(password: event.password));
  }
}