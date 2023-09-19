part of 'smjesa_bloc.dart';

class SmjesaState {
  final List<String> trazi;

  SmjesaState(this.trazi);

  factory SmjesaState.initial() => SmjesaState([]);

  SmjesaState copyWith({List<String>? trazi}) {
    return SmjesaState(trazi ?? this.trazi);
  }
}