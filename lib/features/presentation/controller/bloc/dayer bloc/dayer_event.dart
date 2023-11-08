part of 'dayer_bloc.dart';

@immutable
abstract class DayerEvent {}

class GetTopHeadLinesEvent extends DayerEvent {}

class GetNewsEvent extends DayerEvent {}
