import '../../domain/entites/news.dart';

class NewsModel extends News {
  NewsModel(
      {required super.author,
      required super.title,
      required super.description,
      required super.url,
      required super.urlToImage,
      required super.publishedAt});

  factory NewsModel.fromJson(jsonData) {
    return NewsModel(
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
