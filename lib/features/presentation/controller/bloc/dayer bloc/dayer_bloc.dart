import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dayer/features/presentation/screens/contactus.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/sevice locator/service_locator.dart';
import '../../../../data/models/news_model.dart';
import '../../../../data/models/top_headlines_model.dart';
import '../../../../domain/usecases/get_news.dart';
import '../../../../domain/usecases/get_top_headlines.dart';
import '../../../screens/top_headlines.dart';

part 'dayer_event.dart';

part 'dayer_state.dart';

class DayerBloc extends Bloc<DayerEvent, DayerState> {
  GetTopHeadLines getTopHeadLines;
  GetNews getNews;
  final controller = TextEditingController();
  int i = 0;
  List<TopHeadLinesModel> top = [];
  List<NewsModel> news = [];
  List<Widget> list = [

  TopHeadLinesScreen()
  ,
  ContactUs()

  ];

  List<dynamic> icon = [
    Icons.newspaper,
    Icons.search,
    Image.asset('assets/follow.png'),
  ];

  DayerBloc(this.getTopHeadLines, this.getNews) : super(Intial()) {
    on<DayerEvent>((event, emit) async {
      if (event is GetTopHeadLinesEvent) {
        emit(Loading());

        try {
          top = await getTopHeadLines.excute();
          emit(TopHeadLinesSuccess(top: top));
        } catch (e) {
          emit(Faliure(message: 'لقد حدث خطأ ما'));
        }
      }
      if (event is GetNewsEvent) {
        emit(Loading());

        try {
          news = await getNews.excute(controller.text);
          emit(NewsSuccess(news: news));
        } catch (e) {
          emit(Faliure(message: 'لقد حدث خطأ ما'));
        }
      }
    });
  }
}
