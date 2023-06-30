import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

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
      
    });
  }
}
