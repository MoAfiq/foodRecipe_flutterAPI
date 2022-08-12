import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_project/models/foodRecipe_models.dart';

class BookmarkCubit extends Cubit<Set<FoodRecipe>> {
  BookmarkCubit() : super({});
  void addIntoBookmark(FoodRecipe e, int index) {
    emit({
      ...state,
      e,
    });
    print(e.hits[index].recipe.label);
    print(state);
    print(index);
  }

  void removeFromBookmark(FoodRecipe e, int index) {
    state.remove(e);
    emit({...state});
  }
}
