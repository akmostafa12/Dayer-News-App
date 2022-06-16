import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:news/Screens/breakingnews.dart';
import 'package:news/Models/breakingmodel.dart';
import 'package:news/Widgets/nbar.dart';
import 'package:news/Services/newsservices.dart';
import 'package:news/Providers/provider.dart';
import 'package:news/Screens/search.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);
  @override

  State<Results> createState() => _Results();
}
class _Results extends State<Results> {

bool  isColor = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
            Row(
              children: [
                 Padding(
                   padding: const EdgeInsets.only(left:10),
                   child: Text('نتائج البحث', style: TextStyle(color: isTheme ? Colors.black : Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,),),
                 ),
                const Spacer(flex: 1,),
                Container(
                  height: 40,
                  child: FloatingActionButton(onPressed: (){
                    if (isTheme) {
                      Provider.of<NewsProvider>(context, listen: false).dark();
                      isTheme = false;
                    }
                    else  {
                      Provider.of<NewsProvider>(context,listen: false).light();
                      isTheme = true;
                    }
                  }, child: Icon(isTheme ?Icons.brightness_4 :Icons.brightness_6),backgroundColor: isTheme ?Colors.black : Colors.white,),
                ),
                Container(
                  height: 40,
                  child: FloatingActionButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Search();
                    }));
                  }, child :const Icon(Icons.search),backgroundColor: isTheme ?Colors.black : Colors.white,),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: (){
                      launchUrlString('${Provider.of<NewsProvider>(context,listen: false).newsModel?.url}',mode: LaunchMode.externalApplication,webViewConfiguration: const WebViewConfiguration(enableJavaScript: true,));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Image.network ('${Provider.of<NewsProvider>(context).newsModel?.getImage()}',width: double.infinity,),
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .newsModel
                                  ?.getauthor()} : ', style: const TextStyle(fontSize: 20),maxLines: 1,),
                              const SizedBox(height: 10,),
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .newsModel
                                  ?.getitle()}', style: const TextStyle(
                                  fontSize: 15,),),
                              const SizedBox(height: 10,),
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .newsModel
                                  ?.gedescription()}', style: const TextStyle(
                                  fontSize: 10 ),
                                maxLines: 3,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(thickness: 1,indent: 15,endIndent: 20,color: Colors.grey),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: (){
                      launchUrlString('${Provider.of<NewsProvider>(context,listen: false).newsModel?.url2}',mode: LaunchMode.externalApplication,webViewConfiguration: const WebViewConfiguration(enableJavaScript: true,));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Image.network ('${Provider.of<NewsProvider>(context).newsModel?.getImage2()}',width: double.infinity),
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .newsModel
                                  ?.getauthor2()} : ', style: const TextStyle(fontSize: 20),maxLines: 1,),
                              const SizedBox(height: 10,),
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .newsModel
                                  ?.getitle2()}', style: const TextStyle(
                                fontSize: 15,),),
                              const SizedBox(height: 10,),
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .newsModel
                                  ?.gedescription2()}', style: const TextStyle(
                                  fontSize: 10 ),
                                maxLines: 3,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(thickness: 1,indent: 15,endIndent: 20,color: Colors.grey),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: (){
                      launchUrlString('${Provider.of<NewsProvider>(context,listen: false).newsModel?.url3}',mode: LaunchMode.externalApplication,webViewConfiguration: const WebViewConfiguration(enableJavaScript: true,));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Image.network ('${Provider.of<NewsProvider>(context).newsModel?.getImage3()}',width: double.infinity,),
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .newsModel
                                  ?.getauthor3()} : ', style: const TextStyle(fontSize: 20),maxLines: 1,),
                              const SizedBox(height: 10,),
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .newsModel
                                  ?.getitle3()}', style: const TextStyle(
                                fontSize: 15,),),
                              const SizedBox(height: 10,),
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .newsModel
                                  ?.gedescription3()}', style: const TextStyle(
                                  fontSize: 10 ),
                                maxLines: 3,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(thickness: 1,indent: 15,endIndent: 20,color: Colors.grey),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: (){
                      launchUrlString('${Provider.of<NewsProvider>(context,listen: false).newsModel?.url4}',mode: LaunchMode.externalApplication,webViewConfiguration: const WebViewConfiguration(enableJavaScript: true,));

                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Image.network ('${Provider.of<NewsProvider>(context).newsModel?.getImage4()}',width: double.infinity),
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .newsModel
                                  ?.getauthor4()} : ', style: const TextStyle(fontSize: 20),maxLines: 1,),
                              const SizedBox(height: 10,),
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .newsModel
                                  ?.getitle4()}', style: const TextStyle(
                                fontSize: 15,),),
                              const SizedBox(height: 10,),
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .newsModel
                                  ?.gedescription4()}', style: const TextStyle(
                                  fontSize: 10 ),
                                maxLines: 3,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                  const NBar()

                ],
              ),

            ),
          ],
        ),
        ]
      ),
    );
  }
}
bool  isTheme = true;

