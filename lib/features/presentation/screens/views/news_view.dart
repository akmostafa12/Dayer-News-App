import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key, required this.state});

  final state;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var height = size.height;
    var width = size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 5, right: 5),
      child: ListView.separated(
        separatorBuilder: (context, i) => Column(
          children: [
            Divider(
              thickness: 1,
              height: 22,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        itemBuilder: (context, i) => GestureDetector(
          onTap: () {
            launchUrlString(state.news[i].url,
                mode: LaunchMode.externalNonBrowserApplication);
          },
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey,
                  ),
                  height: height * 0.3,
                  width: width * 1,
                  child: Image.network(state.news[i].urlToImage,
                      fit: BoxFit.fill)),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: SelectableText(state.news[i].author,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15))),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      child: SelectableText(state.news[i].publishedAt,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SelectableText(state.news[i].description,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ],
          ),
        ),
        itemCount: state.news.length,
        shrinkWrap: true,
      ),
    );
  }
}
