part of 'dayer_bloc.dart';

@immutable
abstract class DayerState {}

class Intial extends DayerState {}

class Loading extends DayerState {}

class TopHeadLinesSuccess extends DayerState {
  List<TopHeadLinesModel> top;

  TopHeadLinesSuccess({required this.top});
}

class NewsSuccess extends DayerState {
  List<NewsModel> news;

  NewsSuccess({required this.news});
}

class Faliure extends DayerState {
  String message;

  Faliure({required this.message});
}
