import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:free_course/view/home_screen.dart';

main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          )
        )
      ),
      title: "Free Course",
      home: WelcomeScreen(),
    );
  }
}


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100, right: 36, left: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/intro.svg",
            ),
            Text(
              "Find Your Favourite Course",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xff232323,),
              ),
            ),
            Text(
              "Lorem ipsum dolor sit amet, consulter\n spading elite, sed diam nonumy\n usermod temper inviting ut labor et dolour",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xffBBBBBB),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 129),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomeScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 56,
                  width: 308,
                  decoration: BoxDecoration(
                    color: Color(0xff6CC4EE),
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: Text(
                    'Get Start',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
