import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_project/utils/colors.dart';
import '../../models/foodRecipe_models.dart';
import '../../states/bookmarks.dart';
import 'favourite_list.dart';

class Favourites extends StatelessWidget {
  const Favourites({Key? key, required this.foodRecipe, required this.index})
      : super(key: key);

  final String foodRecipe;
  final int index;

  @override
  Widget build(BuildContext context) {
    print(foodRecipe);
    print(index);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Text('Favourite Recipes'),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      // body: Center(
      //   child: BlocBuilder<BookmarkCubit, Set<FoodRecipe>>(
      //     builder: ((context, state) {
      //       return ListView.builder(
      //         itemCount: state.length,
      //         itemBuilder: (context, state) {
      //           print(state);
      //           return FavouriteList(
      //             foodRecipe: foodRecipe.toString(), index: state,
      //             // index: index,
      //           );
      //         },
      //       );
      //     }),
      //   ),
      // ),
    );
  }
}
