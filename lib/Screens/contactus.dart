import'package:flutter/material.dart';
import 'package:news/Screens/results.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../Widgets/nbar.dart';
class ContactUs extends StatelessWidget {

  String facebook = 'https://www.facebook.com/mostafa.amin.08';
  String instgram = 'https://www.instagram.com/mostafa_amin881/';
  String youtube = 'https://www.youtube.com/channel/UC2KDRd6vwDyLiZ7zNvUo8aw';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Center(
          child: Column(
            children: [
              Text(': تابعنا على',style: TextStyle(color: isTheme ?Colors.black : Colors.white ,fontSize: 30,fontWeight: FontWeight.bold,),),
              const SizedBox(height: 100,),

              GestureDetector(
                onTap: (){
                  launchUrlString(facebook,mode: LaunchMode.externalApplication,webViewConfiguration: const WebViewConfiguration(enableJavaScript: true,));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.facebook,size: 30),
                    const SizedBox(width: 10,),
                    Text('فيسبوك  ',style: TextStyle(color: isTheme ?Colors.black : Colors.white ,fontSize: 20,fontWeight: FontWeight.bold,),),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  launchUrlString(instgram,mode: LaunchMode.externalApplication,webViewConfiguration: const WebViewConfiguration(enableJavaScript: true,));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/instgram.ico',height: 30,width: 30,color:isTheme ?Colors.black : Colors.white),
                    const SizedBox(width: 10,),
                    Text('انستجرام',style: TextStyle(color: isTheme ?Colors.black : Colors.white ,fontSize: 20,fontWeight: FontWeight.bold,),),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  launchUrlString(youtube,mode: LaunchMode.externalApplication,webViewConfiguration: const WebViewConfiguration(enableJavaScript: true,));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/youtube.png',height: 30,width: 30,color: isTheme ?Colors.black : Colors.white,),
                    const SizedBox(width: 10,),
                    Text('يوتيوب  ',style: TextStyle(color: isTheme ?Colors.black : Colors.white ,fontSize: 20,fontWeight: FontWeight.bold,),),
                  ],
                ),
              ),
              const Spacer(flex: 1,),
              const NBar()


            ],
          ),
        ),
      ),

    );
  }
}
