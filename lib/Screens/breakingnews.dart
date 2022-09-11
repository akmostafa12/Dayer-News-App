import 'package:flutter/material.dart';
import 'package:news/Models/breakingmodel.dart';
import 'package:news/Services/newsservices.dart';
import 'package:news/Providers/provider.dart';
import 'package:news/Screens/search.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../main.dart';

class BRN extends StatefulWidget {
  const BRN({Key? key}) : super(key: key);

  @override
  State<BRN> createState() => BRNState();
}

class BRNState extends State<BRN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<BreakingModel>(
          future: NewsServices().gettoday(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              BreakingModel? b = snapshot.data;
              return ListView(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          ' اهم الاخبار',
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
                              Provider.of<NewsProvider>(context, listen: false)
                                  .dark();
                              isTheme = false;
                            } else {
                              Provider.of<NewsProvider>(context, listen: false)
                                  .light();
                              isTheme = true;
                            }
                            setState(() {});
                          },
                          backgroundColor: isTheme ? Colors.black : Colors
                              .white,
                          child: Icon(
                            isTheme ? Icons.brightness_4 : Icons.brightness_6,
                            color: isTheme ? Colors.white : Colors.black,
                          ),
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
                          backgroundColor: isTheme ? Colors.black : Colors
                              .white,
                          child: Icon(
                            Icons.search,
                            color: isTheme ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrlString('${b?.url}',
                          mode: LaunchMode.externalApplication,
                          webViewConfiguration: const WebViewConfiguration(
                            enableJavaScript: true,
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: double.infinity,
                              child: Image.network('${b?.getImage()}')),
                          const SizedBox(
                            height: 30,
                          ),
                          Text('${b?.getauthor()}',
                              style: const TextStyle(fontSize: 20),
                              maxLines: 1),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('${b?.getitle()}',
                              style: const TextStyle(
                                fontSize: 15,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('${b?.gedescription()}',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.clip),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Divider(
                      thickness: 1,
                      indent: 15,
                      endIndent: 20,
                      color: Colors.grey),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            launchUrlString('${b?.url2}',
                                mode: LaunchMode.externalApplication,
                                webViewConfiguration: const WebViewConfiguration(
                                  enableJavaScript: true,
                                ));
                          },
                          child: SizedBox(
                            width: 170,
                            height: 350,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network('${b?.getImage2()}'),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text('${b?.getauthor2()}',
                                    style: const TextStyle(fontSize: 20),
                                    maxLines: 1),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text('${b?.getitle2()}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                    maxLines: 2),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('${b?.gedescription2()}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                    maxLines: 4,
                                    overflow: TextOverflow.clip),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            launchUrlString('${b?.url3}',
                                mode: LaunchMode.externalApplication,
                                webViewConfiguration: const WebViewConfiguration(
                                  enableJavaScript: true,
                                ));
                          },
                          child: SizedBox(
                            width: 170,
                            height: 350,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network('${b?.getImage3()}'),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text('${b?.getauthor3()}',
                                    style: const TextStyle(fontSize: 20),
                                    maxLines: 1),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text('${b?.getitle3()}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                    maxLines: 2),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('${b?.gedescription3()}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                    maxLines: 4,
                                    overflow: TextOverflow.clip),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
