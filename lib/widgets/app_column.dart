import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_project/widgets/small_text.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

bool _isFavourite = false;

class AppColumn extends StatelessWidget {
  final String text;
  final String cuisineType;
  final String calories;
  final String dietLabels;
  final String mealType;
  final String dishType;
  const AppColumn(
      {Key? key,
      required this.text,
      required this.cuisineType,
      required this.calories,
      required this.dietLabels,
      required this.mealType,
      required this.dishType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            BigText(
              text: text,
              size: Dimensions.font26,
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Text('$cuisineType'),
            SizedBox(
              width: 20,
            ),
            SmallText(text: '$mealType'),
            SizedBox(
              width: 20,
            ),
            SmallText(text: '$calories'),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        IconAndTextWidget(
            icon: Icons.set_meal_rounded,
            text: '$dietLabels',
            iconColor: AppColors.yellowColor),
        SizedBox(
          height: Dimensions.height10,
        ),
        IconAndTextWidget(
            icon: Icons.location_on,
            text: '$dishType',
            iconColor: AppColors.mainColor),
        SizedBox(
          height: Dimensions.height10,
        ),
        IconAndTextWidget(
            icon: Icons.timelapse,
            text: "32min",
            iconColor: AppColors.iconColor1)
      ],
    );
  }
}
