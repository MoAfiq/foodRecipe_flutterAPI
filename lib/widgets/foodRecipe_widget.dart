import 'package:flutter/material.dart';
import 'package:food_recipe_project/models/foodRecipe_models.dart';

class FoodRecipeInformation extends StatelessWidget {
  const FoodRecipeInformation({Key? key, required this.foodRecipe})
      : super(key: key);

  final FoodRecipe foodRecipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      color: Colors.blue[200],
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text('${foodRecipe.to}, ${foodRecipe.count}',
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
