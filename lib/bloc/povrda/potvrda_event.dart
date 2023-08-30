part of 'potvrda_bloc.dart';


abstract class PotvrdaEvent {}

class EmailEvent extends PotvrdaEvent {
  final String email;
  EmailEvent(this.email);
}
class PasswordEvent extends PotvrdaEvent {
  final String password;
  PasswordEvent(this.password);
}

