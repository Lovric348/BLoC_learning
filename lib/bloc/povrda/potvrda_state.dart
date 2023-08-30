part of 'potvrda_bloc.dart';

class PotvrdaState {
  final String email;
  final String password;

  PotvrdaState(
      {required this.email, required this.password,});
  

  factory PotvrdaState.initial() => PotvrdaState(
        email: '', password: '',
      );

   PotvrdaState copyWith({
    String? email,
    String? password,
  }) {
    return PotvrdaState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}

  


