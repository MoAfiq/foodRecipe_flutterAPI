import 'package:flutter/material.dart';
import 'package:food_recipe_project/home/food_page_body.dart';
import 'package:food_recipe_project/utils/dimensions.dart';
import 'package:food_recipe_project/widgets/big_text.dart';
import 'package:food_recipe_project/widgets/small_text.dart';

import '../pages/foodRecipe_detail.dart';
import '../utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  late TextEditingController _controller;
  bool _isFoodNameEmpty = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() => _isFoodNameEmpty = _controller.text.isEmpty);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        //Showing the header
        Container(
          child: Container(
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "Malaysia",
                      color: AppColors.mainColor,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "Perak",
                          color: Colors.black54,
                        ),
                        Icon(Icons.arrow_drop_down_rounded),
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.mainColor,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.white,
                      iconSize: Dimensions.iconSize24,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: Text('Search Food Recipe'),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Form(
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Food Recipe',
                                            icon: Icon(Icons.food_bank),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                      child: Text('Search'),
                                      onPressed: _isFoodNameEmpty
                                          ? null
                                          : () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      FoodRecipeDetail(
                                                    foodName: _controller.text,
                                                  ),
                                                ),
                                              );
                                            })
                                ],
                              );
                            });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        //Showing the body
        Expanded(
            child: SingleChildScrollView(
          child: FoodPageBody(),
        )),
      ],
    ));
  }
}
