import 'package:flutter/material.dart';
import 'package:food_recipe_project/pages/aboutus/aboutstyle.dart';
import 'package:food_recipe_project/pages/aboutus/appBar.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'about_section.dart';
import 'animatedtext_header.dart';
import 'folding_content.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     backgroundColor: Colors.blue,
    //     body: ListView(
    //       children: [
    //         Stack(
    //           children: [
    //             Container(
    //               height: 350,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //               ),
    //             ),
    //             Container(
    //               height: 150,
    //               decoration: BoxDecoration(
    //                   color: Color(0xFFf3f3f3),
    //                   borderRadius:
    //                       BorderRadius.only(bottomLeft: Radius.circular(80.0))),
    //             ),
    //             MyAppBar()
    //             //AppBar
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );

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
            ],
          ),
        ),
      ),
    );
  }
}
