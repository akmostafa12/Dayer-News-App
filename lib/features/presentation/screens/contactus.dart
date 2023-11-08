import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactUs extends StatelessWidget {
  String facebook = 'https://www.facebook.com/mostafa.amin.08';
  String instgram = 'https://www.instagram.com/mostafa_amin881/';
  String youtube = 'https://www.youtube.com/channel/UC2KDRd6vwDyLiZ7zNvUo8aw';

  ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'داير',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Center(
          child: Column(
            children: [
              Text(
                ': تابعنا على',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  launchUrlString(facebook,
                      mode: LaunchMode.externalApplication,
                      webViewConfiguration: const WebViewConfiguration(
                        enableJavaScript: true,
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.facebook,
                      size: 30,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'فيسبوك  ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  launchUrlString(instgram,
                      mode: LaunchMode.externalApplication,
                      webViewConfiguration: const WebViewConfiguration(
                        enableJavaScript: true,
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/instgram.ico',
                      height: 30,
                      width: 30,
                      color: Colors.pinkAccent,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'انستجرام',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  launchUrlString(youtube,
                      mode: LaunchMode.externalApplication,
                      webViewConfiguration: const WebViewConfiguration(
                        enableJavaScript: true,
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/youtube.png',
                      height: 30,
                      width: 30,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'يوتيوب  ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'بواسطة : مصطفى امين',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
