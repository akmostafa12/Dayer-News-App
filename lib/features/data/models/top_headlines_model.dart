import '../../domain/entites/top_headlines.dart';

class TopHeadLinesModel extends TopHeadLines {
  TopHeadLinesModel(
      {required super.author,
      required super.title,
      required super.description,
      required super.url,
      required super.urlToImage,
      required super.publishedAt});

  factory TopHeadLinesModel.fromJson(Map<String, dynamic> jsonData) {
    return TopHeadLinesModel(
        author: jsonData['author'] != null ? jsonData['author'] : 'غير معروف',
        title: jsonData['title'] != null ? jsonData['title'] : 'غير معروف',
        description: jsonData['description'] != null
            ? jsonData['description']
            : 'غير معروف',
        url: jsonData['url'] != null ? jsonData['url'] : 'غير معروف',
        urlToImage: jsonData['urlToImage'] != null
            ? jsonData['urlToImage']
            : 'غير معروف',
        publishedAt: jsonData['publishedAt'] != null
            ? jsonData['publishedAt']
            : 'غير معروف');
  }
}
