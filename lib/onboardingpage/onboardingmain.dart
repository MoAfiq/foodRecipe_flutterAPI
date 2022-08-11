import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe_project/onboardingpage/home_screen.dart';
import 'package:food_recipe_project/onboardingpage/screen_merged.dart';
import 'package:food_recipe_project/onboardingpage/screen_one.dart';
import 'package:food_recipe_project/states/foodRecipe_cubit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = 0;
  //initScreen = preferences.getInt('initScreen');
  // await preferences.setInt('initScreen', 1);
  runApp(BlocProvider(
    create: (context) => FoodRecipeCubit(),
    child: MainOnboarding(),
  ));
}

class MainOnboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My Title",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : 'home',
      routes: {
        'home': (context) => HomeScreen(),
        'onboard': (context) => OnboardingScreenv2(),
      },
    );
  }
}
