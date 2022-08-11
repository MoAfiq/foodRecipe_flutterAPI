import 'package:flutter/material.dart';
import 'package:food_recipe_project/home/main_food_page.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(
          width: size.width,
          height: size.height * 0.6,
          fit: BoxFit.cover,
          image: AssetImage('assets/image/searching.png'),
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
      top: size.height * 0.65,
      child: Container(
        width: size.width,
        padding: EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'SELECT ITEMS',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: white,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Lorem Ipsum is simply dummy \ntext of the printing and typesetting industry.',
              textAlign: TextAlign.end,
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
          width: size.width,
          height: size.height * 0.6,
          fit: BoxFit.cover,
          image: const AssetImage('assets/image/ingredient.png'),
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
              'PURCHASE',
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
              'Lorem Ipsum is simply dummy \ntext of the printing and typesetting industry.',
              textAlign: TextAlign.start,
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
          width: size.width,
          height: size.height * 0.6,
          fit: BoxFit.cover,
          image: AssetImage('assets/image/goodtogo.png'),
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
            Text(
              'DELIVERY',
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
            Text(
              'Lorem Ipsum is simply dummy \ntext of the printing and typesetting industry.',
              textAlign: TextAlign.start,
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
