import 'package:flutter/material.dart';
import 'package:food_recipe_project/models/foodRecipe_models.dart';
import 'popular_recipe_details.dart';

class FoodRecipeInformation extends StatelessWidget {
  FoodRecipeInformation(
      {Key? key, required this.foodRecipe, required this.recipes})
      : super(key: key);

  List<RecipeClass> recipes = [];
  final FoodRecipe foodRecipe;

  //Capitalize each words that deems suitable in the UI
  String allWordsCapitilize(String str) {
    return str.toLowerCase().split(' ').map((word) {
      String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    // print('Check check check 123 123 123');
    return Container(
        child: Column(
      children: <Widget>[
        // Expanded(
        //     child: BlocBuilder<FoodRecipeCubit, FoodRecipeState>(
        Expanded(
          child: ListView.builder(
            itemCount: foodRecipe.hits.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PopularRecipeDetails(
                              index: index,
                              foodName: foodRecipe,
                            )),
                  )
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          offset: const Offset(0.0, 10.0),
                          blurRadius: 10.0,
                          spreadRadius: -6.0),
                    ],
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.35),
                        BlendMode.multiply,
                      ),
                      image: NetworkImage(
                              foodRecipe.hits[index].recipe.image.toString())
                          as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            '${foodRecipe.hits[index].recipe.label}',
                            style: const TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 7),
                                  Text(
                                    allWordsCapitilize(
                                        '${foodRecipe.hits[index].recipe.cuisineType.join(', ')}'),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.schedule,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 7),
                                  Text(
                                    '${foodRecipe.hits[index].recipe.totalTime.toString()}min',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
