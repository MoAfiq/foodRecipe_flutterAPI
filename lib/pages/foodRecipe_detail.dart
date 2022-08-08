import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_project/states/foodRecipe_cubit.dart';
import 'package:food_recipe_project/states/foodRecipe_state.dart';
import 'package:food_recipe_project/widgets/foodRecipe_widget.dart';

class FoodRecipeDetail extends StatelessWidget {
  const FoodRecipeDetail({Key? key, required this.foodName}) : super(key: key);
  final String foodName;

  @override
  Widget build(BuildContext context) {
    FoodRecipeCubit cubit = BlocProvider.of<FoodRecipeCubit>(context)
      ..fetchFoodRecipe(foodName);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Recipe Detail',
        ),
      ),
      body: Center(
        child: BlocBuilder<FoodRecipeCubit, FoodRecipeState>(
          bloc: BlocProvider.of<FoodRecipeCubit>(context),
          builder: (context, state) {
            if (state is FoodRecipeLoading) {
              return const CircularProgressIndicator();
            }

            if (state is FoodRecipeLoaded) {
              return FoodRecipeInformation(foodRecipe: state.foodRecipe);
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
