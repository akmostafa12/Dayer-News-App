import 'package:dayer/features/data/models/news_model.dart';
import 'package:dayer/features/data/models/top_headlines_model.dart';
import 'package:dayer/features/domain/entites/news.dart';
import 'package:dio/dio.dart';

import '../../presentation/controller/bloc/Dayer bloc/dayer_bloc.dart';

abstract class BaseRemoteDataSource {
  Future<List<TopHeadLinesModel>> getTopHeadLines();

  Future<List<NewsModel>> getNews(String search);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<List<NewsModel>> getNews(String search) async {
    Dio dio = Dio();
    final response = await dio.get(
        'https://newsapi.org/v2/everything?q=$search&apiKey=14c3400a175d492c8ae1bcbb4d379bde');
    if (response.statusCode == 200) {
      var data = response.data['articles'];
      List<NewsModel> news = [];
      for (var item in data) {
        news.add(NewsModel.fromJson(item));
      }
      return news;
    } else {
      throw Exception('Erorr');
    }
  }

  @override
  Future<List<TopHeadLinesModel>> getTopHeadLines() async {
    final response = await Dio().get(
        'https://newsapi.org/v2/everything?q=اليوم&apiKey=14c3400a175d492c8ae1bcbb4d379bde');
    var data = response.data['articles'];
    List<TopHeadLinesModel> top = [];

    if (response.statusCode == 200) {
      for (var item in data) {
        top.add(TopHeadLinesModel.fromJson(item));
      }
      return top;
    } else {
      throw Exception('Erorr');
    }
  }
}
