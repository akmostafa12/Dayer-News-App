import 'package:flutter/material.dart';
import 'package:news/Providers/provider.dart';
import 'package:provider/provider.dart';
import '../Screens/breakingnews.dart';
import '../Screens/contactus.dart';
import '../Screens/results.dart';
import '../Models/breakingmodel.dart';
import '../Services/newsservices.dart';
class NBar extends StatelessWidget {
  const NBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      color: isTheme ? const Color(0xFFFFF) : const Color(0xf202020),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ()async{
              NewsServices t = NewsServices();
              BreakingModel t1 = await t.gettoday();
              Provider.of<NewsProvider>(context,listen: false).breakingmodel=t1;
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return BRN();
              }));


            },
            child: Column(
              children: [
                Icon(Icons.today,size: 25,color: isTheme ?Colors.black : Colors.white,),
                Text('اهم الاخبار',style: TextStyle(fontSize: 15,color: isTheme ?Colors.black : Colors.white),)
              ],
            ),
          ),
          const SizedBox(width: 50,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const Results();
              }));
            },
            child: Column(
              children: [
                Icon(Icons.list,size: 25,color: isTheme ?Colors.black : Colors.white,),
                Text('نتائج البحث',style: TextStyle(fontSize: 15,color:isTheme ?Colors.black : Colors.white),)
              ],
            ),
          ),
          const SizedBox(width: 50,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ContactUs();
              }));
            },
            child: Column(
              children: [
                Image.asset('images/follow.png',height: 25,width: 40,color: isTheme ?Colors.black : Colors.white,),
                Text('تابعنا',style: TextStyle(fontSize: 15,color:isTheme ?Colors.black : Colors.white),)
              ],
            ),
          ),


        ],
      ),
    );
  }
}

