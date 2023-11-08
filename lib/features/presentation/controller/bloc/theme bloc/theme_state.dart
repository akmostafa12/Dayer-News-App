part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class Light extends ThemeState {
  ThemeData light;

  Light({required this.light});
}

class Dark extends ThemeState {
  ThemeData dark;

  Dark({required this.dark});
}
