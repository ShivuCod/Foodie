import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering/modules/auth/page/login.dart';
import 'package:food_ordering/utils/constant.dart';
import 'package:food_ordering/utils/theme.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  static const String routerName = '/intro';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.network(
            "https://th.bing.com/th/id/R.318fd8c40ed4d1d2b62fa10ba367c456?rik=CSGvXaswYNNFfw&riu=http%3a%2f%2fwww.pixelstalk.net%2fwp-content%2fuploads%2f2016%2f08%2fBest-Food-HD-Backgrounds.jpg&ehk=CXObrv3MyuYCxR2yFK%2fmJ7IcGJ1FFqRV1ovmwu5hjmE%3d&risl=&pid=ImgRaw&r=0",
            fit: BoxFit.fitHeight,
          )),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: const SizedBox(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                verticalBox(50),
                  const SizedBox(
                    width: 220,
                    child: Text(
                      "it's not just Food, It's an Experience",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                    ),
                  ),
            verticalBox(20),
                  const  SizedBox(
                    width: 300,
                    child: Text(
                      "User Interface and User Experience, or UI and UX, includes all user-business interactions. Although providing a positive user experience is crucial for a number of reasons, the primary one is that it can put you ahead of your competition.",
                      style: TextStyle(
                        fontSize: 14,

                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
              Center(
                child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(side: BorderSide(color: buttonColor),borderRadius: BorderRadius.circular(30)),
                                  minimumSize: const Size(200, 60),
                                  backgroundColor: Colors.transparent),

                              onPressed: () =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LoginPage())),
                              child:  Text(
                                "Get Started",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: buttonColor,
                                    letterSpacing: 1),
                              )),
              ),
                  verticalBox(20),

                  const Center(
                      child: SizedBox(
                          width: 300,
                          child: Text(
                            "Unlimited access to 7,000+ world-class courses, hands-on projects, and job-ready certificate programs—all included in your subscription",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, color: Colors.white70),
                          ))),
            verticalBox(20)
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
