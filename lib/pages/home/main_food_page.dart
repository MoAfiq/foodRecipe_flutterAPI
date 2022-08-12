import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_project/pages/home/food_page_body.dart';
import 'package:food_recipe_project/utils/dimensions.dart';
import 'package:food_recipe_project/widgets/big_text.dart';
import 'package:food_recipe_project/widgets/footer.dart';
import 'package:food_recipe_project/pages/food/foodRecipe_detail.dart';
import 'package:food_recipe_project/utils/colors.dart';
import '../aboutus/aboutus_mainpage.dart';
import '../favouriteRecipe/favourites_recipe.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  late TextEditingController _controller;
  bool _isFoodNameEmpty = false;

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

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
                      Row(
                        children: [
                          BigText(
                            text: "F00DIES",
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.restaurant_menu,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                      Text(
                        'COOK DELICIOUS FOODS',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: Colors.amber,
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
                                          controller: _controller,
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
                                          },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Showing the body
          const Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: navigationKey,
        color: Colors.amber,
        backgroundColor: Colors.transparent,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(
            Icons.favorite,
            size: 30,
          ),
          Icon(
            Icons.person,
            size: 30,
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainFoodPage()));
              break;
            case 1:
              // BlocProvider.of<BookmarkCubit>(context).addIntoBookmark;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Favourites(
                            foodRecipe: _controller.text,
                            index: index,
                            // index: index,
                          )));
              print('navigate to fav = ${context}');
              print('name = ${_controller.text}');
              print(index);
              break;
            case 2:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
          }
        },
      ),
    );
  }
}
