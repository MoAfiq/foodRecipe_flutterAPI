import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_project/models/foodRecipe_models.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/big_text.dart';
import '../widgets/icon_and_text_widget.dart';
import '../widgets/small_text.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key, required this.trend}) : super(key: key);

  final FoodRecipe trend;

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'RECOMMENDED DISHES',
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        //slider section
        Container(
          // color: Colors.redAccent,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        //dots
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //popular text
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Current Trending Dishes"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Best Recipes",
                ),
              )
            ],
          ),
        ),

        //list of food and images that are trending
        Container(
          height: 800,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10),
                child: Row(
                  children: [
                    //Image Section
                    Container(
                      width: 120,
                      height: 120,
                      child: Image.network(
                          '${widget.trend.hits[index + 10].recipe.image}'),
                    ),
                    //Text Container
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight:
                                  Radius.circular(Dimensions.radius20)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                  text:
                                      "${widget.trend.hits[index + 10].recipe.label}"),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              SmallText(
                                  text:
                                      "${widget.trend.hits[index + 10].recipe.cuisineType[0]} Cuisine"),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(
                                      icon: Icons.person,
                                      text:
                                          "${widget.trend.hits[index + 10].recipe.source}",
                                      iconColor: AppColors.iconColor1),
                                  IconAndTextWidget(
                                      icon: Icons.restaurant,
                                      text:
                                          "${widget.trend.hits[index + 10].recipe.mealType[0]}",
                                      iconColor: AppColors.mainColor),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Center(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Image.network(
                  '${widget.trend.hits[index].recipe.image}',
                  height: 250,
                  width: 500,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white10, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white10, offset: Offset(5, 0)),
                  ]),
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        '${widget.trend.hits[index].recipe.label}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                'Recipe by: ${widget.trend.hits[index].recipe.source}',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                'Origin: ${widget.trend.hits[index].recipe.cuisineType[0]}',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                'Suitable for: ${widget.trend.hits[index].recipe.mealType[0]}',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
