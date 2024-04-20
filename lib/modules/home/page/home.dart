import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ordering/utils/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routerName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Icon(FontAwesomeIcons.gripVertical,
              color: Colors.black, size: 20),
          title: const Text(
            "Home",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello!",
                style: TextStyle(fontSize: 20,color: Colors.black,letterSpacing: 1),
              ),
              
              Text("Are you hungry?",style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.w700,),),
              Text("Let's order and eat..",style:TextStyle(color: Colors.grey,fontSize: 19))

            ],
          ),
        ),
      )),
    );
  }
}
