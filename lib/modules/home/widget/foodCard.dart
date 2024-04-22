import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering/utils/constant.dart';

class FoodCard extends StatelessWidget {
  const FoodCard(
      {super.key,
      required this.img,
      required this.title,
      required this.subTitle,required this.price,required this.onPressed});
  final String img;
  final String title;
  final String subTitle;
  final double price;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 170,
        height: 180,
        child: Stack(
          children: [
            Positioned(
              bottom: 1,
              child: Container(
                width: 160,
                height: 120,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(

                    color: Colors.grey.shade100, borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisSize:MainAxisSize.min,
                  children: [
                    verticalBox(25),

                    Text(
                     title,
                      style: const TextStyle(
                          color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
                    ),

                    Text(
                      subTitle,
                      style: const TextStyle(
                          color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w100),
                    ),
                    Text("₹ ${price.toString()}",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
            ),
         Positioned(top: 1,child: Image.asset(img, height: 120, width:150),)
          ],
        ),
      ),
    );
  }
}
