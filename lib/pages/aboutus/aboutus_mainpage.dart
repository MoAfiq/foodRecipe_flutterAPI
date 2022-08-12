import 'package:flutter/material.dart';
import 'package:food_recipe_project/pages/aboutus/appBar.dart';
import 'about_section.dart';
import 'folding_content.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              MyAppBar(),
              SizedBox(height: 20),
              AboutSection(),
              FoldingCellSimpleDemo(),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
