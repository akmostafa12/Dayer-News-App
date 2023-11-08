import 'package:dayer/features/data/models/news_model.dart';

import '../../data/models/top_headlines_model.dart';

abstract class BaseRepository {
  Future<List<TopHeadLinesModel>> getTopHeadLines();

  Future<List<NewsModel>> getNews(String search);
}
