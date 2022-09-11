import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/Models/breakingmodel.dart';

import '../Models/newsmodel.dart';
class NewsServices{
  String baseUrl ='https://newsapi.org/v2';
  Future<NewsModel> getNews({required String? search})async{
    Uri url = Uri.parse('$baseUrl/everything?q=$search&apiKey=14c3400a175d492c8ae1bcbb4d379bde');
    http.Response response = await http.get(url);
    Map<String,dynamic> news = jsonDecode(response.body);
    Map<String,dynamic> n1 = news['articles'][0];
    Map<String,dynamic> n2 = news['articles'][1];
    Map<String,dynamic> n3 = news['articles'][2];
    Map<String,dynamic> n4 = news['articles'][3];

    NewsModel m = NewsModel(author: n1['author'], title: n1['title'], description: n1['description'], url: n1['url'], image: n1['urlToImage'], author2: n2['author'], title2: n2['title'], description2: n2['description'], url2: n2['url'], image2: n2['urlToImage'], author3: n3['author'], title3: n3['title'], description3: n3['description'], url3: n3['url'], image3: n3['urlToImage'], author4: n4['author'], title4: n4['title'], description4: n4['description'], url4: n4['url'], image4: n4['urlToImage']);
    return m;
  }
  Future<BreakingModel> gettoday ()async{
    Uri url =Uri.parse('$baseUrl/top-headlines?country=eg&apiKey=14c3400a175d492c8ae1bcbb4d379bde');
    http.Response r =await http.get(url);
    Map<String,dynamic> breaking =jsonDecode(r.body);
    Map<String,dynamic> b1 = breaking['articles'][0];
    Map<String,dynamic> b2 = breaking['articles'][1];
    Map<String,dynamic> b3 = breaking['articles'][2];
    BreakingModel bk = BreakingModel(author: b1['author'], title: b1['title'], description: b1['description'], url: b1['url'], image: b1['urlToImage'], author2: b2['author'], title2: b2['title'], description2: b2['description'], url2: b2['url'], image2: b2['urlToImage'], author3: b3['author'], title3: b3['title'], description3: b3['description'], url3: b3['url'], image3: b3['urlToImage']);
    return bk;


  }
}
