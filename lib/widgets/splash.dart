import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_project/widgets/splash_screen.dart';

void main() {
  runApp(SplashIntro());
}

class SplashIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sdfvsdv',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: SplashScreen(),
    );
  }
}
