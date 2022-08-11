import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_project/home/trending.dart';
import '../states/foodRecipe_cubit.dart';
import '../states/foodRecipe_state.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    FoodRecipeCubit cubit = BlocProvider.of<FoodRecipeCubit>(context)
      ..fetchFoodRecipe('chicken');

    return Center(
      child: BlocBuilder<FoodRecipeCubit, FoodRecipeState>(
          bloc: BlocProvider.of<FoodRecipeCubit>(context),
          builder: (context, state) {
            if (state is FoodRecipeLoading) {
              return const CircularProgressIndicator();
            }

            if (state is FoodRecipeLoaded) {
              return Trending(trend: state.foodRecipe);
            }

            return Text(state is FoodRecipeError
                ? state.errorMessage
                : 'Unknown error');
          }),
    );
  }
}
