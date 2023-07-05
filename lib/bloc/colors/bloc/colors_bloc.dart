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
      final availableTitleColors = [
        const Color.fromARGB(255, 22, 80, 179),
        Color.fromARGB(255, 5, 120, 61),
        Color.fromARGB(255, 103, 88, 7),
        Color.fromARGB(255, 94, 5, 52),
      ];
      final availableColors = [
        Colors.amber,
        Colors.yellow,
        const Color.fromARGB(255, 123, 204, 241),
        Color.fromARGB(255, 118, 245, 87),
      ];
      final currentColor = state.color;
      final currentTitleColor = state.colorTitle;

      Color nextColor;
      int number;
      Color titleColor;

      do {
        nextColor = availableColors[random.nextInt(availableColors.length)];
      } while (nextColor == currentColor);
      do {
        titleColor = availableTitleColors[random.nextInt(availableTitleColors.length)];
      } while (titleColor == currentTitleColor);

      number = state.number + 1;

      emit(ColorsState(color: nextColor, number: number, colorTitle: titleColor));
    });
    on<ResetEvent>((event, emit) {
      emit(ColorsState.initial());
    });
    on<DecreaseEvent>((event, emit) {
      final random2 = Random();
      final availableTitleColors2 = [
        Colors.amber,
        Colors.yellow,
        const Color.fromARGB(255, 123, 204, 241),
        Color.fromARGB(255, 118, 245, 87),
      ];
      final availableColors2 = [
        const Color.fromARGB(255, 22, 80, 179),
        Color.fromARGB(255, 5, 120, 61),
        Color.fromARGB(255, 103, 88, 7),
        Color.fromARGB(255, 94, 5, 52),
      ];
      final currentColor2 = state.color;
      final currentTitleColor2 = state.colorTitle;

      Color nextColor2;
      int number;
      Color titleColor2;

      do {
        nextColor2 = availableColors2[random2.nextInt(availableColors2.length)];
      } while (nextColor2 == currentColor2);
      do {
        titleColor2 = availableTitleColors2[random2.nextInt(availableTitleColors2.length)];
      } while (titleColor2 == currentTitleColor2);

      number = state.number - 1;

      emit(ColorsState(color: nextColor2, number: number, colorTitle: titleColor2));
    });
    on<SeriousPageEvent>((event, emit) {
      emit(ColorsState(color: state.color, number: state.number, colorTitle: state.colorTitle));
    });
    
  }
}
