import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_project/models/foodRecipe_models.dart';
import 'package:food_recipe_project/widgets/app_icon.dart';
import 'package:food_recipe_project/widgets/exandable_text_widget.dart';
import 'package:food_recipe_project/widgets/foodRecipe_widget.dart';
import '../../states/foodRecipe_cubit.dart';
import '../../states/foodRecipe_state.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularRecipeDetails extends StatefulWidget {
  const PopularRecipeDetails({
    Key? key,
    required this.foodName,
  }) : super(key: key);

  final FoodRecipe foodName;

  @override
  State<PopularRecipeDetails> createState() => _PopularRecipeDetailsState();
}

class _PopularRecipeDetailsState extends State<PopularRecipeDetails> {
  late List foodDetailedRecipe;

  @override
  void initState() {
    super.initState();
    foodDetailedRecipe = [];
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularRecipeImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/spaggheti.jpg"))),
            ),
          ),
          //icons widget
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                children: [AppIcon(icon: Icons.arrow_back_ios)],
              )),
          //introduction of food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularRecipeImgSize - 20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          topLeft: Radius.circular(Dimensions.radius20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        text: '${widget.foodName.hits[index].recipe.label}',
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(text: "Summary"),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                            text:
                                "A recipe for Chinese-inspired five-spice tofu, marinated in a mixture of soy sauce, sesame oil, and Chinese five spice, and baked in the oven. This Chinese five spice tofu is perfect for adding into vegetable stir-fries, Chinese-style salads, any kind of noodle dish, or just for a quick Asian flavored snack. Prepare your tofu. Like most vegetarian and vegan tofu recipes, this one will taste best if you press the tofu first.Pre-heat the oven to 350 F. Slice your well-pressed tofu into 1/2-inch long strips (or you can cut them into another shape if you prefer). Lightly grease a baking pan and arrange the prepared tofu in a single layer in the pan."),
                      ))
                    ],
                  )))

          //expandable text widget
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            )),
        child: Row(
          children: [
            Container(
              // padding: EdgeInsets.only(
              //     top: Dimensions.height20,
              //     bottom: Dimensions.height20,
              //     left: Dimensions.width20,
              //     right: Dimensions.width20),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class PopularRecipeDetails extends StatelessWidget {
//   const PopularRecipeDetails({Key? key, required this.foodName})
//       : super(key: key);
//
//   final FoodRecipe foodName;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           //background image
//           Positioned(
//             left: 0,
//             right: 0,
//             child: Container(
//               width: double.maxFinite,
//               height: Dimensions.popularRecipeImgSize,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: AssetImage("assets/image/spaggheti.jpg"))),
//             ),
//           ),
//           //icons widget
//           Positioned(
//               top: Dimensions.height45,
//               left: Dimensions.width20,
//               right: Dimensions.width20,
//               child: Row(
//                 children: [AppIcon(icon: Icons.arrow_back_ios)],
//               )),
//           //introduction of food
//           Positioned(
//               left: 0,
//               right: 0,
//               bottom: 0,
//               top: Dimensions.popularRecipeImgSize - 20,
//               child: Container(
//                   padding: EdgeInsets.only(
//                       left: Dimensions.width20,
//                       right: Dimensions.width20,
//                       top: Dimensions.height20),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(Dimensions.radius20),
//                           topLeft: Radius.circular(Dimensions.radius20)),
//                       color: Colors.white),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AppColumn(
//                         text: '${widget.foodName}',
//                       ),
//                       SizedBox(
//                         height: Dimensions.height20,
//                       ),
//                       BigText(text: "Summary"),
//                       SizedBox(
//                         height: Dimensions.height20,
//                       ),
//                       Expanded(
//                           child: SingleChildScrollView(
//                         child: ExpandableTextWidget(
//                             text:
//                                 "A recipe for Chinese-inspired five-spice tofu, marinated in a mixture of soy sauce, sesame oil, and Chinese five spice, and baked in the oven. This Chinese five spice tofu is perfect for adding into vegetable stir-fries, Chinese-style salads, any kind of noodle dish, or just for a quick Asian flavored snack. Prepare your tofu. Like most vegetarian and vegan tofu recipes, this one will taste best if you press the tofu first.Pre-heat the oven to 350 F. Slice your well-pressed tofu into 1/2-inch long strips (or you can cut them into another shape if you prefer). Lightly grease a baking pan and arrange the prepared tofu in a single layer in the pan."),
//                       ))
//                     ],
//                   )))
//
//           //expandable text widget
//         ],
//       ),
//       bottomNavigationBar: Container(
//         height: Dimensions.bottomHeightBar,
//         padding: EdgeInsets.only(
//             top: Dimensions.height30,
//             bottom: Dimensions.height30,
//             left: Dimensions.width20,
//             right: Dimensions.width20),
//         decoration: BoxDecoration(
//             color: AppColors.buttonBackgroundColor,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(Dimensions.radius20 * 2),
//               topRight: Radius.circular(Dimensions.radius20 * 2),
//             )),
//         child: Row(
//           children: [
//             Container(
//               // padding: EdgeInsets.only(
//               //     top: Dimensions.height20,
//               //     bottom: Dimensions.height20,
//               //     left: Dimensions.width20,
//               //     right: Dimensions.width20),
//
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(Dimensions.radius20),
//                 color: Colors.white,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
