import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/constant.dart';
import '../../FoodDetail/model/food.dart';

final qty=StateProvider((ref) => 0);
class ItemCard extends ConsumerWidget {
  const ItemCard({super.key,required this.food});
  final Food food;


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                food.img,
                width: 120,
                height: 100,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900)),
                    Text(food.ingredients,
                        softWrap: true,
                        style: const TextStyle(fontSize: 14)),
                    Text(food.location,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              Text("₹ ${food.price}",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  horizontalBox(10),
                  GestureDetector(
                    onTap: () => ref.watch(qty) != 0
                        ? ref.read(qty.notifier).state--
                        : null,
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.black),
                        child: const Icon(FontAwesomeIcons.minus,
                            size: 20, color: Colors.white)),
                  ),
                  horizontalBox(10),
                  const Text(
                    // ref.watch(qty).toString(),
                    "0",
                    style: TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  horizontalBox(10),
                  GestureDetector(
                    onTap: () => ref.read(qty.notifier).state++,
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.black),
                        child: const Icon(FontAwesomeIcons.plus,
                            size: 20, color: Colors.white)),
                  ),
                ],
              ),
              horizontalBox(10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 40),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                              color: Colors.black))),
                  onPressed: () {},
                  child: const Text(
                    "Remove",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
