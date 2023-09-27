part of 'pretrazi_bloc.dart';

abstract class PretraziEvent extends Equatable {
  const PretraziEvent();

  @override
  List<Object> get props => [];
}

class PretragaHashtagovaEvent extends PretraziEvent{ 
  final String value;

  PretragaHashtagovaEvent(this.value);
}