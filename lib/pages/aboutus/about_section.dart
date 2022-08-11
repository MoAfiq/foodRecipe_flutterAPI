import 'package:flutter/material.dart';

import 'aboutstyle.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        // color: Colors.white,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0))),
        child: Row(
          children: [
            //Image Section
            Container(
              width: 380,
              height: 290,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/BusinessIntro.gif"))),
            ),
          ],
        ));
  }
}
