import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TopHeadLineView extends StatelessWidget {
  const TopHeadLineView({super.key, required this.state});

  final state;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var height = size.height;
    var width = size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                launchUrlString(state.top[0].url,
                    mode: LaunchMode.externalNonBrowserApplication);
              },
              child: Column(
                children: [
                  Container(
                      height: height * 0.3,
                      width: width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey,
                      ),
                      child: Image.network(state.top[0].urlToImage,
                          fit: BoxFit.fill)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: SelectableText(state.top[0].author,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15))),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                          child: SelectableText(state.top[0].publishedAt,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15))),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SelectableText(state.top[0].description,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              height: 20,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      launchUrlString(state.top[1].url,
                          mode: LaunchMode.externalNonBrowserApplication);
                    },
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey,
                            ),
                            height: height * 0.2,
                            width: width * 0.5,
                            child: Image.network(state.top[1].urlToImage,
                                fit: BoxFit.fill)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: SelectableText(state.top[1].author,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15))),
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                                child: SelectableText(state.top[1].publishedAt,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15))),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SelectableText(state.top[1].description,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      launchUrlString(state.top[2].url,
                          mode: LaunchMode.externalNonBrowserApplication);
                    },
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey,
                            ),
                            height: height * 0.2,
                            width: width * 0.5,
                            child: Image.network(state.top[2].urlToImage,
                                fit: BoxFit.fill)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: SelectableText(state.top[2].author,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15))),
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                                child: SelectableText(state.top[2].publishedAt,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15))),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SelectableText(state.top[2].description,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
