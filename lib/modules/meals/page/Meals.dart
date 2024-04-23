import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ordering/modules/home/widget/iconBox.dart';

import '../../FoodDetail/page/foodDetail.dart';
import '../../home/widget/foodCard.dart';

class Meals extends StatelessWidget {
  const Meals({super.key});
static const String routerName = '/meals';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        primary: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: const Icon(FontAwesomeIcons.gripVertical,
            color: Colors.black, size: 20),
        title: const Text(
          "Meals",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  IconBox(iconData: FontAwesomeIcons.burger,currentTab: 1,),
                  IconBox(iconData: FontAwesomeIcons.mugHot),
                  IconBox(iconData: FontAwesomeIcons.champagneGlasses),
                  IconBox(iconData: FontAwesomeIcons.bowlRice),
                  IconBox(iconData: FontAwesomeIcons.pizzaSlice),
                  IconBox(iconData: FontAwesomeIcons.egg),
                  IconBox(iconData: FontAwesomeIcons.cakeCandles),
                ],
              ),
            ),
            Expanded(
                child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                FoodCard(
                    img: "assets/burger.png",
                    title: "Cheese Burger",
                    subTitle: "Food Mohola",
                    price: 89.0,
                    onPressed: () =>
                        Navigator.pushNamed(context, FoodDetail.routerName)),
                FoodCard(
                    img: "assets/biryani.png",
                    title: "Cheese Burger",
                    subTitle: "Food Mohola",
                    price: 246.0,
                    onPressed: () =>
                        Navigator.pushNamed(context, FoodDetail.routerName)),
                FoodCard(
                    img: "assets/Doner_kebab.png",
                    title: "Cheese Burger",
                    subTitle: "Food Mohola",
                    price: 199.0,
                    onPressed: () =>
                        Navigator.pushNamed(context, FoodDetail.routerName)),
                FoodCard(
                    img: "assets/Cas.png",
                    title: "Cheese Burger",
                    subTitle: "Food Mohola",
                    price: 280.0,
                    onPressed: () =>
                        Navigator.pushNamed(context, FoodDetail.routerName)),
                FoodCard(
                    img: "assets/hellofresh.png",
                    title: "Cheese Burger",
                    subTitle: "Food Mohola",
                    price: 149.0,
                    onPressed: () =>
                        Navigator.pushNamed(context, FoodDetail.routerName)),
                FoodCard(
                    img: "assets/slices_tomatos.png",
                    title: "Cheese Burger",
                    subTitle: "Food Mohola",
                    price: 239.0,
                    onPressed: () =>
                        Navigator.pushNamed(context, FoodDetail.routerName)),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
