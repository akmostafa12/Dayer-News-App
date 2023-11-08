import 'package:dayer/features/data/models/news_model.dart';
import 'package:dayer/features/domain/repository/base_repository.dart';

class GetNews {
  BaseRepository baseRepository;

  GetNews(this.baseRepository);

  Future<List<NewsModel>>excute(String search) async {
    return await baseRepository.getNews(search);
  }
}
