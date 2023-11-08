import 'package:dayer/features/domain/repository/base_repository.dart';

import '../../data/models/top_headlines_model.dart';

class GetTopHeadLines {
  BaseRepository baseRepository;

  GetTopHeadLines(this.baseRepository);

  Future<List<TopHeadLinesModel>> excute() async {
    return await baseRepository.getTopHeadLines();
  }
}
