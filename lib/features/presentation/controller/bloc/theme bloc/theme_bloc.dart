import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  bool isMode = true;
  bool isLight = true;

  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async {
      if (event is GetLightThemeEvent) {
        emit(Light(
          light: ThemeData(brightness: Brightness.light, useMaterial3: true),
        ));
      }
      if (event is GetDarkThemeEvent) {
        emit(Dark(
          dark: ThemeData(brightness: Brightness.dark, useMaterial3: true),
        ));
      }
    });
  }
}
