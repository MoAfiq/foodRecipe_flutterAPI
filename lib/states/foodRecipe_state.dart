import '../models/foodRecipe_models.dart';

abstract class FoodRecipeState {}

class FoodRecipeLoading extends FoodRecipeState {}

class FoodRecipeLoaded extends FoodRecipeState {
  final FoodRecipe foodRecipe;

  FoodRecipeLoaded({required this.foodRecipe});
}

class FoodRecipeError extends FoodRecipeState {
  final String errorMessage;

  FoodRecipeError({required this.errorMessage});
}
