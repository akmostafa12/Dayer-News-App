import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Models/breakingmodel.dart';

import '../Models/newsmodel.dart';

class NewsProvider extends ChangeNotifier{
  NewsModel ? _newsModel;
  BreakingModel ? _breakingModel;
  bool ismode = false;
  ThemeMode ? th ;
  set newsModel (NewsModel ? news){
    _newsModel = news;
    notifyListeners();
  }
  NewsModel? get newsModel => _newsModel;

  set breakingmodel (BreakingModel ? breaking){
    _breakingModel = breaking;
    notifyListeners();
  }
  BreakingModel? get breakingmodel => _breakingModel;
  void light() {
    th = ThemeMode.light;

    notifyListeners();
    }
  void dark() {
    th = ThemeMode.dark;

    notifyListeners();
  }

}


