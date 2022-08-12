import 'package:flutter/material.dart';
import 'package:food_recipe_project/models/foodRecipe_models.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({Key? key, required this.foodRecipe, required this.index})
      : super(key: key);

  final FoodRecipe foodRecipe;
  final int index;

  String allWordsCapitilize(String str) {
    return str.toLowerCase().split(' ').map((word) {
      String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 20);
    const rowSpacer = SizedBox(height: 20);
    print(foodRecipe.hits[index].recipe.label);

    return SingleChildScrollView(
      child: SizedBox(
        width: 100.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Colors.white.withOpacity(0.5),
              width: 1,
            ),
          ),
          elevation: 20,
          shadowColor: Colors.purpleAccent,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Icon(
                  Icons.access_alarm,
                  color: Colors.white,
                  size: 35,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: foodRecipe.hits.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 10),
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
                                image: NetworkImage(foodRecipe
                                    .hits[index].recipe.image
                                    .toString()) as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        })
                    // Hero(
                    //   tag: foodRecipe.hits[index].recipe.image,
                    //   child: Container(
                    //     width: 200,
                    //     height: 400,
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       backgroundBlendMode: BlendMode.color,
                    //       borderRadius: BorderRadius.circular(30),
                    //       image: DecorationImage(
                    //         fit: BoxFit.fitHeight,
                    //         image: NetworkImage(foodRecipe.hits[0].recipe.image),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
