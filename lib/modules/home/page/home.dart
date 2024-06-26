
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ordering/modules/FoodDetail/page/foodDetail.dart';
import 'package:food_ordering/modules/home/providers/foodProvider.dart';
import 'package:food_ordering/modules/home/sevices/home_service.dart';

import 'package:food_ordering/modules/home/widget/foodCard.dart';
import 'package:food_ordering/modules/home/widget/searchBox.dart';
import 'package:food_ordering/utils/constant.dart';
import 'package:food_ordering/utils/theme.dart';

import '../../FoodDetail/model/food.dart';



class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const String routerName = '/home';

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final foodLt= ref.watch(foodList);
    
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        primary: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: const Icon(FontAwesomeIcons.gripVertical,
            color: Colors.black, size: 20),
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        actions: [IconButton(onPressed: ()=>HomeService().getData(), icon: Icon(FontAwesomeIcons.magnifyingGlass))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello!",
                style: TextStyle(
                    fontSize: 20, color: Colors.black, letterSpacing: 1),
              ),
              const Text(
                "Are you hungry?",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text("Let's order and eat..",
                  style: TextStyle(color: Colors.grey, fontSize: 19)),
              verticalBox(10),
              SearchBox(onPressed: () {}),
              verticalBox(10),
              const Text(
                "Recommended for you",
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              verticalBox(10),
              Consumer(builder: (_,ref,child){
               return ref.watch(foodList).when(data: (food)=> Wrap(
                   alignment: WrapAlignment.center,
                   runAlignment: WrapAlignment.center,
                   spacing: 12,
                   runSpacing: 12,
               children:List.generate(food.length, (index) =>  FoodCard(
                   img: food[index].img!,
                   title:food[index].name! ,
                   subTitle: food[index].location!,
                   price: double.parse(food[index].price!.toString()),
                   onPressed:()=> Navigator.pushNamed(context, FoodDetail.routerName))),),
                    error: (error, _) => const Center(child: Text('No Patients'),),
                    loading: () => const Center(child: CircularProgressIndicator()));

              }) ,
               Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children:[
                  FoodCard(
                      img: "assets/Doner_kebab.png",
                      title: "Cheese Burger",
                      subTitle: "Food Mohola",
                      price: 199.0,
                   onPressed:()=> Navigator.pushNamed(context, FoodDetail.routerName)),
                  FoodCard(
                      img: "assets/Cas.png",
                      title: "Cheese Burger",
                      subTitle: "Food Mohola",
                      price: 280.0,
                    onPressed:()=> Navigator.pushNamed(context, FoodDetail.routerName)),
                  FoodCard(
                      img: "assets/hellofresh.png",
                      title: "Cheese Burger",
                      subTitle: "Food Mohola",
                      price: 149.0,
                   onPressed:()=> Navigator.pushNamed(context, FoodDetail.routerName)),
                  FoodCard(
                    img: "assets/slices_tomatos.png",
                    title: "Cheese Burger",
                    subTitle: "Food Mohola",
                    price: 239.0,
                    onPressed:()=> Navigator.pushNamed(context, FoodDetail.routerName)),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
