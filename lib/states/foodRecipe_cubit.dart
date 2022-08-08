import 'package:food_recipe_project/models/foodRecipe_models.dart';
import 'package:food_recipe_project/services/foodRecipe_services.dart';
import 'package:food_recipe_project/states/foodRecipe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodRecipeCubit extends Cubit<FoodRecipeState> {
  FoodRecipeCubit() : super(FoodRecipeLoading());

  Future<void> fetchFoodRecipe(String foodName) async {
    FoodRecipeService foodRecipeService = FoodRecipeService();
    emit(FoodRecipeLoading());

    try {
      FoodRecipe foodRecipe =
          await foodRecipeService.fetchFoodRecipeInformation(foodName);
      emit(
        FoodRecipeLoaded(foodRecipe: foodRecipe),
      );
    } catch (e) {
      emit(FoodRecipeError(errorMessage: e.toString()));
    }
  }
}
