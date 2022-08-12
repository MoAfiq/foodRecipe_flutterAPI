import 'package:flutter/material.dart';
import 'package:food_recipe_project/pages/home/main_food_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/slanding_clipper.dart';
import 'constants/constants.dart';
import 'dart:math' as math;

typedef List<Widget> _pageBuilder(BuildContext context);

final List<_pageBuilder> _pages = [_pageOne, _pageTwo, _pageThree];

class OnboardingScreenv2 extends StatefulWidget {
  const OnboardingScreenv2({Key? key}) : super(key: key);

  @override
  State<OnboardingScreenv2> createState() => _OnboardingScreenv2State();
}

class _OnboardingScreenv2State extends State<OnboardingScreenv2> {
  int page = 0;

  void goToHomePage() {
    SharedPreferences.getInstance().then(
      (preferences) => preferences.setInt("initScreen", 1),
    );
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MainFoodPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            ...(_pages[page](context)),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Container>.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: appPadding / 4),
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          border: Border.all(color: black, width: 2),
                          shape: BoxShape.circle,
                          color: page == index ? white : yellow),
                    );
                  })),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: appPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: goToHomePage,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: appPadding),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (page + 1 < _pages.length) {
                          setState(() {
                            page++;
                          });
                        } else {
                          goToHomePage();
                        }
                      },
                      backgroundColor: white,
                      child: const Icon(
                        Icons.navigate_next_rounded,
                        color: black,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> _pageOne(BuildContext context) {
  //it will helps to return the size of the screen
  Size size = MediaQuery.of(context).size;

  return [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          width: size.width / 0.5,
          height: size.height * 0.6,
          fit: BoxFit.fitWidth,
          image: AssetImage('assets/image/searchingpic.png'),
        ),
        ClipPath(
          clipper: SlandingClipper(),
          child: Container(
            height: size.height * 0.4,
            color: yellow,
          ),
        )
      ],
    ),
    Positioned(
      top: size.height * 0.66,
      child: Container(
        width: size.width,
        padding: EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'SEARCH YOUR FOOD',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(
              'Foodies has tremendous of recipe that could be your next dinner or supper or breakfast or lunch. Search whatever you are craving now.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    ),
  ];
}

List<Widget> _pageTwo(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return [
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RotatedBox(
          quarterTurns: 2,
          child: ClipPath(
            clipper: SlandingClipper(),
            child: Container(
              height: size.height * 0.4,
              color: yellow,
            ),
          ),
        ),
        Image(
          width: size.width * 8,
          height: size.height * 0.6,
          fit: BoxFit.fitWidth,
          image: const AssetImage('assets/image/ingredientpic.png'),
        ),
      ],
    ),
    Positioned(
      top: size.height * 0.05,
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'RECIPES',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: white,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(
              'You do not need to write down any recipe because we provide you all the recipe that you need. It is never too late to have a good food.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    ),
  ];
}

List<Widget> _pageThree(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return [
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(
          width: size.width / 0.5,
          height: size.height * 0.6,
          fit: BoxFit.fitWidth,
          image: AssetImage('assets/image/goodtogopic.png'),
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: ClipPath(
            clipper: SlandingClipper(),
            child: Container(
              height: size.height * 0.4,
              color: yellow,
            ),
          ),
        )
      ],
    ),
    Positioned(
      top: size.height * 0.65,
      child: Container(
        width: size.width,
        padding: EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ENJOY',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: white,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(
              'A cookbook must have recipes, but it should not be a blueprint. It should be more inspirational; it should be a guide. Your good to go now.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    ),
  ];
}
