import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_project/main.dart';

class FooterElement extends StatefulWidget {
  const FooterElement({Key? key}) : super(key: key);

  @override
  State<FooterElement> createState() => _FooterElementState();
}

class _FooterElementState extends State<FooterElement> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  // int index = ;

  final screens = [
    MyApp(),
    //Favouritepage(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        Icons.food_bank,
        size: 30,
      ),
      Icon(
        Icons.favorite,
        size: 30,
      ),
      Icon(
        Icons.person,
        size: 30,
      ),
    ];

    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        // body: screens[index],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Colors.black),
          ),
          child: CurvedNavigationBar(
            key: navigationKey,
            color: Colors.orangeAccent,
            backgroundColor: Colors.transparent,
            height: 60,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 300),
            // index: index,
            items: items,
            // onTap: (index) => setState(() => this.index),
          ),
        ),
      ),
    );
  }
}
