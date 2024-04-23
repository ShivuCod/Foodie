import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ordering/modules/auth/page/login.dart';
import 'package:food_ordering/utils/constant.dart';
import 'package:food_ordering/utils/theme.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  static const String routerName = '/intro';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: buttonColor,
        body: Column(
          children: [
            verticalBox(100),
            Image.network(
              "https://www.pngarts.com/files/7/Food-Delivery-Service-PNG-High-Quality-Image.png",
              width: 200,
            ),
            verticalBox(10),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "it's not just Food, It's an Experience",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                    ),
                    const Text(
                      "Get the fastest food delivery. Completely Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    verticalBox(30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: const Size(160, 45)),
                      onPressed: () =>
                          Navigator.popAndPushNamed(context, LoginPage.routerName),
                      child: const Text("Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
