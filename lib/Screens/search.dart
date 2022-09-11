import 'package:flutter/material.dart';
import 'package:news/Screens/results.dart';
import 'package:news/Services/newsservices.dart';
import 'package:news/Providers/provider.dart';
import 'package:provider/provider.dart';
import '../Models/newsmodel.dart';
import '../main.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String? search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تطبيق داير',
          style: TextStyle(
            color: isTheme ? Colors.black : Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'قم بالبحث عن الاخبار',
            style: TextStyle(
              color: isTheme ? Colors.black : Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(
                label: const Text('Search'),
                labelStyle:
                TextStyle(color: isTheme ? Colors.black : Colors.white),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      NewsServices ne = NewsServices();
                      NewsModel n = await ne.getNews(search: search);
                      Provider
                          .of<NewsProvider>(context, listen: false)
                          .newsModel = n;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return Results();
                          }));
                    },
                    child: Icon(
                      Icons.search,
                      color: isTheme ? Colors.black : Colors.white,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isTheme ? Colors.black : Colors.white)),
                border: const OutlineInputBorder(),
              ),
              onChanged: (data) {
                search = data;
              },
              onSubmitted: (_) async {
                try {
                  NewsServices ne = NewsServices();
                  NewsModel n = await ne.getNews(search: search);
                  Provider
                      .of<NewsProvider>(context, listen: false)
                      .newsModel =
                      n;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Results();
                  }));
                } catch (ex) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('لا يوجد نتائج')));
                }
              },
            ),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isTheme) {
            Provider.of<NewsProvider>(context, listen: false).dark();
            isTheme = false;
          } else {
            Provider.of<NewsProvider>(context, listen: false).light();
            isTheme = true;
          }
          setState(() {});
        },
        backgroundColor: isTheme ? Colors.black : Colors.white,
        child: Icon(isTheme ? Icons.brightness_4 : Icons.brightness_6),
      ),
    );
  }
}
