part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class GetLightThemeEvent extends ThemeEvent {}

class GetDarkThemeEvent extends ThemeEvent {}
