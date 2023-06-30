import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


part 'colors_event.dart';
part 'colors_state.dart';

class ColorsBloc extends Bloc<ColorsEvent, ColorsState> {
  ColorsBloc() : super(ColorsState.initial()) {
    on<ColorChangeEvent>((event, emit) {
      final random = Random();
      final availableColors = [
        Colors.amber,
        Colors.yellow,
        const Color.fromARGB(255, 123, 204, 241),
        Color.fromARGB(255, 118, 245, 87),
      ];
      final currentColor = state.color;

      Color nextColor;
      int nextNumber;

      do {
        nextColor = availableColors[random.nextInt(availableColors.length)];
      } while (nextColor == currentColor);

      nextNumber = state.number + 1;

      emit(ColorsState(color: nextColor, number: nextNumber));
    });
    on<ResetEvent>((event, emit) {
      emit(ColorsState.initial());
    });
    on<DecreaseEvent>((event, emit) {
      final random2 = Random();
      final availableColors2 = [
        const Color.fromARGB(255, 22, 80, 179),
        Color.fromARGB(255, 5, 120, 61),
        Color.fromARGB(255, 103, 88, 7),
        Color.fromARGB(255, 94, 5, 52),
      ];
      final currentColor2 = state.color;

      Color nextColor2;
      int nextNumber2;

      do {
        nextColor2 = availableColors2[random2.nextInt(availableColors2.length)];
      } while (nextColor2 == currentColor2);

      nextNumber2 = state.number - 1;

      emit(ColorsState(color: nextColor2, number: nextNumber2));
    });
  }
}
