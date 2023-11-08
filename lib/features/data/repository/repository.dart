import 'package:dayer/features/data/models/news_model.dart';
import 'package:dayer/features/data/models/top_headlines_model.dart';
import 'package:dayer/features/data/source/remote_data_source.dart';
import 'package:dayer/features/domain/repository/base_repository.dart';

class Repository implements BaseRepository {
  BaseRemoteDataSource baseRemoteDataSource;

  Repository(this.baseRemoteDataSource);

  @override
  Future<List<NewsModel>> getNews(String search) async {
    return await baseRemoteDataSource.getNews(search);
  }

  @override
  Future<List<TopHeadLinesModel>> getTopHeadLines() async {
    return await baseRemoteDataSource.getTopHeadLines();
  }
}
