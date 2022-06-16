import 'package:flutter/material.dart';
import 'package:news/Screens/results.dart';
import 'package:news/Widgets/nbar.dart';
import 'package:news/Providers/provider.dart';
import 'package:news/Screens/search.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BRN extends StatefulWidget {
  const BRN({Key? key}) : super(key: key);
  @override
  State<BRN> createState() => BRNState();
}

class BRNState extends State<BRN> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            const SizedBox(height: 50,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Text(' اهم الاخبار', style: TextStyle(color: isTheme ? Colors.black : Colors.white,
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
            const SizedBox(height: 70,),
            Center(
              child: GestureDetector(
                onTap: (){
                   launchUrlString('${Provider.of<NewsProvider>(context,listen: false).breakingmodel?.url}',mode: LaunchMode.externalApplication,webViewConfiguration: const WebViewConfiguration(enableJavaScript: true,));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: double.infinity,
                                  child: Image.network ('${Provider.of<NewsProvider>(context).breakingmodel?.getImage()}')
                              ),
                              const SizedBox(height: 30,),
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .breakingmodel
                                  ?.getauthor()} : ', style: const TextStyle(fontSize: 20),maxLines: 1),
                              const SizedBox(height: 10,),
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .breakingmodel
                                  ?.getitle()}', style: const TextStyle(
                                  fontSize: 15, )),
                              const SizedBox(height: 10,),
                              Text('${Provider
                                  .of<NewsProvider>(context)
                                  .breakingmodel
                                  ?.gedescription()}', style: const TextStyle(
                                  fontSize: 15,),
                                  maxLines: 3,overflow: TextOverflow.clip),
                            ],
                          ),
                ),
              ),
            ),
            const SizedBox(height: 40,),
            const Divider(thickness: 1,indent: 15,endIndent: 20,color: Colors.grey),
            const SizedBox(height: 35,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      launchUrlString('${Provider.of<NewsProvider>(context,listen: false).breakingmodel?.url2}',mode: LaunchMode.externalApplication,webViewConfiguration: const WebViewConfiguration(enableJavaScript: true,));
                    },
                    child: Container(
                      width: 170,
                      height:350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network ('${Provider.of<NewsProvider>(context).breakingmodel?.getImage2()}'),
                          const SizedBox(height: 15,),
                          Text('${Provider
                              .of<NewsProvider>(context)
                              .breakingmodel
                              ?.getauthor2()} : ', style: const TextStyle(fontSize: 20),maxLines: 1),
                          const SizedBox(height: 5,),
                          Text('${Provider
                              .of<NewsProvider>(context)
                              .breakingmodel
                              ?.getitle2()}', style: const TextStyle(
                            fontSize: 15, ),maxLines: 2),
                          const SizedBox(height: 10,),
                          Text('${Provider
                              .of<NewsProvider>(context)
                              .breakingmodel
                              ?.gedescription2()}', style: const TextStyle(
                            fontSize: 10,),
                              maxLines: 4,overflow: TextOverflow.clip),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 35,),
                  GestureDetector(
                    onTap: (){
                      launchUrlString('${Provider.of<NewsProvider>(context,listen: false).breakingmodel?.url3}',mode: LaunchMode.externalApplication,webViewConfiguration: const WebViewConfiguration(enableJavaScript: true,));
                    },
                    child: Container(
                      width: 170,
                      height:350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network ('${Provider.of<NewsProvider>(context).breakingmodel?.getImage3()}'),
                          const SizedBox(height: 15,),
                          Text('${Provider
                              .of<NewsProvider>(context)
                              .breakingmodel
                              ?.getauthor3()} : ', style: const TextStyle(fontSize: 20),maxLines: 1),
                          const SizedBox(height: 5,),
                          Text('${Provider
                              .of<NewsProvider>(context)
                              .breakingmodel
                              ?.getitle3()}', style: const TextStyle(
                            fontSize: 15, ),maxLines: 2),
                          const SizedBox(height: 10,),
                          Text('${Provider
                              .of<NewsProvider>(context)
                              .breakingmodel
                              ?.gedescription3()}', style: const TextStyle(
                            fontSize: 10,),
                              maxLines: 4,overflow: TextOverflow.clip),
                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1,),
            const NBar()





          ]

      ),
    );
  }
  }




