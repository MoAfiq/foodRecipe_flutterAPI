import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_project/models/foodRecipe_models.dart';
import 'package:food_recipe_project/states/bookmarks.dart';
import 'package:food_recipe_project/widgets/app_icon.dart';
import 'package:food_recipe_project/widgets/expandable_text_widget.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import 'package:string_extensions/string_extensions.dart';

class PopularRecipeDetails extends StatefulWidget {
  const PopularRecipeDetails(
      {Key? key, required this.foodName, required this.index})
      : super(key: key);

  final FoodRecipe foodName;
  final int index;

  String toTitleCase(String str) {
    if (str.isEmpty) return str;
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }

  @override
  State<PopularRecipeDetails> createState() => _PopularRecipeDetailsState();
}

class _PopularRecipeDetailsState extends State<PopularRecipeDetails> {
  bool _isFavourite = false;

  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    print(index);
    print('Find me too?');
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            //background image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularRecipeImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.35),
                      BlendMode.multiply,
                    ),
                    image: NetworkImage(
                        widget.foodName.hits[index].recipe.image.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //icons widget
            Positioned(
                top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: AppIcon(icon: Icons.arrow_back_ios)),
                  ],
                )),
            //introduction of food
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: Dimensions.popularRecipeImgSize - 20,
                child: Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        top: Dimensions.height20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            topLeft: Radius.circular(Dimensions.radius20)),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AppColumn(
                                text:
                                    '${widget.foodName.hits[index].recipe.label.toTitleCase}',
                                cuisineType:
                                    ('${widget.foodName.hits[index].recipe.cuisineType.join(', ').toTitleCase}'),
                                calories:
                                    ('${widget.foodName.hits[index].recipe.calories.toStringAsFixed(2)} cal'),
                                dietLabels:
                                    ('${widget.foodName.hits[index].recipe.dietLabels.join(', ').toTitleCase}'),
                                mealType:
                                    ('${widget.foodName.hits[index].recipe.mealType[0].toTitleCase}'),
                                dishType:
                                    ('${widget.foodName.hits[index].recipe.dishType.join(', ').toTitleCase}'),
                                source:
                                    ('${widget.foodName.hits[index].recipe.source.toTitleCase}'),
                              ),
                              IconButton(
                                color: Colors.red,
                                icon: Icon(_isFavourite
                                    ? Icons.favorite
                                    : Icons.favorite_border),
                                onPressed: () {
                                  setState(() {
                                    _isFavourite = !_isFavourite;
                                  });
                                  BlocProvider.of<BookmarkCubit>(context)
                                      .addIntoBookmark(
                                          widget.foodName, widget.index);
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: "Ingredients"),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ExpandableTextWidget(
                                  text:
                                      ("${widget.foodName.hits[index].recipe.ingredientLines.join(', ')}"),
                                ),
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )))

            //expandable text widget
          ],
        ));
  }
}
