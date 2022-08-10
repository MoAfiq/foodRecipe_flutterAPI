import 'package:flutter/material.dart';
import 'package:food_recipe_project/models/foodRecipe_models.dart';
import 'package:food_recipe_project/utils/recipe_card.dart';

class FoodRecipeInformation extends StatelessWidget {
  FoodRecipeInformation(
      {Key? key, required this.foodRecipe, required this.recipes})
      : super(key: key);

  List<RecipeClass> recipes = [];
  final FoodRecipe foodRecipe;

  // @override
  // void initState() {
  //   super.initState();
  //   getRecipes();
  // }
  //
  // Future<void> getRecipes() async {
  //   recipes = await FoodRecipeService.fetchFoodRecipeInformation();
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var index = 0;
    print('Check check check 123 123 123');
    return Scaffold(
        body: Column(
      children: <Widget>[
        Image.network(
            'https://api.edamam.com/api/recipes/v2/${foodRecipe.hits.first.recipe.image}'),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return RecipeCard(
                title: recipes[index].label,
                cookTime: recipes[index].totalTime.toString(),
                rating: recipes[index].cuisineType.toString(),
                thumbnailUrl: recipes[index].calories.toString(),
              );
            }),
        Text(
            '${foodRecipe.to} checking<><><> ${foodRecipe.count} <><><>checking<><><> ${recipes.first.label}'),
      ],
    ));
    //   child: Column(
    //     children: [
    //       const SizedBox(
    //         height: 20,
    //       ),
    //       Text('${foodRecipe.to}, ${foodRecipe.count}',
    //           style:
    //               const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
    //       RecipeCard(
    //         title: 'My Recipe',
    //         rating: '4.9',
    //         cookTime: '30 min',
    //         thumbnailURL:
    //             'https://edamam-product-images.s3.amazonaws.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMD%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCICYX5qGqJrAOAp6EUG5JgTYYYIxzL1KAo3%2BGHnTStvQIAiBDtqcX%2B1fGXLZh%2B7iIKYzPwzLrNx6CV3UHolBt0rSphSrSBAgpEAAaDDE4NzAxNzE1MDk4NiIMOAwtx7OGsGuHEQE9Kq8Etb073fQxpvf6is8m5xKEsUW8oYMo5uWoHJZxyoCmH%2BFF1SiSXluClXUnd22YRNaup%2ForVVMb%2Fjp%2Bzr%2FUd3Ai64BoK6k5W30EQps%2B8gHM%2B97SPFvvNMFj1qAxHHlpBm3rTe61ZufmhdJ5a%2BGT3F6X9khECGQK%2BsN7iwa%2FUVZsMicbGq%2B5WUdRhgFOyw1SkkYf8kGLxpzMe2Wsh7GPG93JOWNzG4pFXUPy9CjXuVALz2NncBIPP5zgLqf7jeE7MCpUcDkWRokq%2FytMG9ppKPK01mY5l%2FmSBuvH80euaVEYEhXQ%2F6Qmt8xWeg9E%2FyErjIZ%2FvKdyVFJ9OFXuY1HXkhxaBwfhC3o%2B6t7IPwqiZwM%2FYIq1i4a6jEY8kW6yfYFDQf4jrqC0MRG6Ar6y9J5RMwJx8iTDKpq58U5w9aRnib3Ba3cUt%2F3zfNVIl4OBz%2B5xsKtVlqATv9uvidio5dIaxF%2F81urmRgx%2BK78cC9XcXNs7eowd4g6QkGWRB12wS8A3symwi7UPJRHIH00af9t7Rlrf1pXtfeumKtFCxC15gWVPeqCPRlUhtQn%2Fh4%2Bp5IpRgP6vHJ6v9cdJv5f7irAoSxyphB0BmpsyOFSL%2B3HFr2NCJ4O0NYkKPP3IU%2FxlpBAIv59blfiNNPTdiq%2BCFwt6cY0PQxmLQUrWuANqrTrjl9SIRXNon2Q6rOwqzeeC7q13rGMi9YaIy8JNhFn9BPoSq2xEydcxiJVQiXnGWg6OvOulTjDTpsiXBjqqAXQP1DHUaqOr%2FNsPq13G5Jqa%2ByfAIAtekM7eEakZZmtXM%2BHkN6qBUNMQT0IWRbOLxQunnmF0LfWchZNaDuRIdZsiPywqv9xRiAOeo4civwjI8QYBr0uTUyR99jnTdROWrmM%2BcfGFTYFsFCyAxqmr71sHzpHna4%2BcNiVSozXdwfLbW2fhaW1RmrcCm89AOyiYvhhNVXl%2BiSUwzw53ZPK90WEnPxYWFXZVCRL%2B&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220809T084837Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFJQXIRS6P%2F20220809%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=9a55ef4aaa649928326081f6f437828f842bacdf97ec87e45b1ebf4c0a9cf7bf',
    //         thumbnailUrl: '',
    //       )
    //     ],
    //   ),
    // );
  }
}
