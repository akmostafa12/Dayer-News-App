import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/Providers/provider.dart';
import 'package:news/Widgets/bottomNavigationBar.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

bool isTheme = true;

void main() {
  runApp(ChangeNotifierProvider<NewsProvider>(
      create: (_) {
        return NewsProvider();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            textTheme: const TextTheme(
                bodyText2: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            appBarTheme: const AppBarTheme(
                color: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    systemNavigationBarColor: Colors.transparent),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ))),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            textTheme: const TextTheme(
              bodyText2: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    systemNavigationBarColor: Colors.transparent),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ))),
        themeMode: Provider
            .of<NewsProvider>(context)
            .th,
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          duration: 3000,
          splash: 'images/splash.png',
          splashIconSize: 200,
          nextScreen: const BNB(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
        ));
  }
}
