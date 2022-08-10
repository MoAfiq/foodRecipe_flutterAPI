import 'package:flutter/material.dart';
import 'package:food_recipe_project/home/main_food_page.dart';
import 'package:food_recipe_project/pages/aboutus/aboutus_mainpage.dart';
import 'package:food_recipe_project/pages/food/popular_recipe_details.dart';
import 'package:food_recipe_project/pages/foodRecipe_detail.dart';
import 'package:food_recipe_project/widgets/footer.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoodRecipeDetail(
        foodName: '',
      ),
    );
  }
}
