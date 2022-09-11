import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:news/Screens/breakingnews.dart';
import 'package:news/Screens/contactus.dart';

import '../main.dart';

class BNB extends StatefulWidget {
  const BNB({Key? key}) : super(key: key);

  @override
  State<BNB> createState() => _BNBState();
}

class _BNBState extends State<BNB> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [const BRN(), ContactUs()];
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: const Color(0xff040307),
          strokeColor: const Color(0x30040307),
          unSelectedColor: const Color(0xffacacac),
          backgroundColor: isTheme ? Colors.white : Colors.white10,
          items: [
            CustomNavigationBarItem(
                icon: Icon(
                  Icons.today,
                  size: 25,
                  color: isTheme ? Colors.black : Colors.white,
                ),
                title: Text(
                  'اهم الاخبار',
                  style: TextStyle(
                      fontSize: 15,
                      color: isTheme ? Colors.black : Colors.white),
                )),
            CustomNavigationBarItem(
                icon: Image.asset(
                  'images/follow.png',
                  height: 25,
                  width: 40,
                  color: isTheme ? Colors.black : Colors.white,
                ),
                title: Text(
                  'تابعنا',
                  style: TextStyle(
                      fontSize: 15,
                      color: isTheme ? Colors.black : Colors.white),
                )),
          ],
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
        ));
  }
}
