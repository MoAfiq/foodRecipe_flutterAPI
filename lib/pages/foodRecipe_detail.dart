import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_project/states/foodRecipe_cubit.dart';
import 'package:food_recipe_project/states/foodRecipe_state.dart';
import 'package:food_recipe_project/widgets/foodRecipe_widget.dart';

class FoodRecipeDetail extends StatelessWidget {
  const FoodRecipeDetail({Key? key, required this.foodName}) : super(key: key);
  final String foodName;

  //Capitalize each words that deems suitable in the UI
  String allWordsCapitilize(String str) {
    return str.toLowerCase().split(' ').map((word) {
      String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    FoodRecipeCubit cubit = BlocProvider.of<FoodRecipeCubit>(context)
      ..fetchFoodRecipe(foodName);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          allWordsCapitilize('$foodName Recipe List'),
        ),
      ),
      body: Center(
        child: BlocBuilder<FoodRecipeCubit, FoodRecipeState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is FoodRecipeLoading) {
              return const CircularProgressIndicator();
            }

            if (state is FoodRecipeLoaded) {
              print(state.foodRecipe.count);
              print('Checking whether the food recipe is loaded');
              return FoodRecipeInformation(
                foodRecipe: state.foodRecipe,
                recipes: [],
              );
            }

            return Text(state is FoodRecipeError
                ? state.errorMessage
                : 'Unknown error');
          },
        ),
      ),
    );
  }
}
