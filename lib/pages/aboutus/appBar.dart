import 'package:flutter/material.dart';
import 'package:food_recipe_project/pages/aboutus/aboutstyle.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      height: 150,
      decoration: BoxDecoration(
        color: aboutmainColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "About Us",
            style: titleText,
          ),
        ],
      ),
    );
  }
}
