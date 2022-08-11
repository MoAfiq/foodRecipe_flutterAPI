import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../onboardingpage/screen_merged.dart';
import 'menutest.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //set time to load the new page

    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => OnboardingScreenv2()));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFF800B),
              Color(0xFFCE1010),
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset("assets/image/foodcarousel.json"),
            ),
            SizedBox(height: 20),
            Text(
              "Welcome To Foodies",
              style: TextStyle(
                  fontFamily: 'Lobster Two',
                  fontSize: 26,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
