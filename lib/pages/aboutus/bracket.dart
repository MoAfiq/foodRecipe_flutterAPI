import 'package:flutter/material.dart';

class Bracket extends StatelessWidget {
  const Bracket({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: Stack(
        children: [
          Positioned(
            top: 35,
            left: 20,
            child: Material(
              child: Container(
                height: 180.0,
                width: 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: new Offset(-10.0, 10.0),
                        blurRadius: 20.0,
                        spreadRadius: 4.0)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 30,
            child: Card(
              elevation: 10.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/image/aboutus.png"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
