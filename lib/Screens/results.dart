import 'package:flutter/material.dart';
import 'package:news/Providers/provider.dart';
import 'package:news/Screens/search.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../main.dart';

class Results extends StatefulWidget {
  @override
  Results({
    Key? key,
    this.url,
    this.image,
    this.author,
    this.title,
    this.description,
  }) : super(key: key);
  String? url;
  String? image;
  String? author;
  String? title;
  String? description;

  @override
  State<Results> createState() => _Results();
}

class _Results extends State<Results> {
  @override
  Widget build(BuildContext context) {
    final p = Provider
        .of<NewsProvider>(context)
        .newsModel;
    List<Results> results = [
      Results(
          url: '${p?.url}',
          image: '${p?.getImage()}',
          author: '${p?.getauthor()}',
          title: '${p?.getitle()}',
          description: '${p?.gedescription()}'),
      Results(
          url: '${p?.url2}',
          image: '${p?.getImage2()}',
          author: '${p?.getauthor2()}',
          title: '${p?.getitle2()}',
          description: '${p?.gedescription2()}'),
      Results(
          url: '${p?.url3}',
          image: '${p?.getImage3()}',
          author: '${p?.getauthor3()}',
          title: '${p?.getitle3()}',
          description: '${p?.gedescription3()}'),
      Results(
          url: '${p?.url4}',
          image: '${p?.getImage4()}',
          author: '${p?.getauthor4()}',
          title: '${p?.getitle4()}',
          description: '${p?.gedescription4()}'),
    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'نتائج البحث',
                  style: TextStyle(
                    color: isTheme ? Colors.black : Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                height: 30,
                child: FloatingActionButton(
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
                  child:
                  Icon(isTheme ? Icons.brightness_4 : Icons.brightness_6),
                ),
              ),
              SizedBox(
                height: 30,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const Search();
                        }));
                  },
                  backgroundColor: isTheme ? Colors.black : Colors.white,
                  child: const Icon(Icons.search),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, i) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrlString('${results[i].url}',
                                mode: LaunchMode.externalApplication,
                                webViewConfiguration: const WebViewConfiguration(
                                  enableJavaScript: true,
                                ));
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Image.network(
                                  '${results[i].image}',
                                  width: double.infinity,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${results[i].author}',
                                      style: const TextStyle(fontSize: 20),
                                      maxLines: 1,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${results[i].title}',
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${results[i].description}',
                                      style: const TextStyle(fontSize: 10),
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Divider(
                            thickness: 1,
                            indent: 15,
                            endIndent: 20,
                            color: Colors.grey),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
              itemCount: results.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
