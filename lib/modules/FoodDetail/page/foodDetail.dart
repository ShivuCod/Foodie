import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ordering/modules/add_to_card/page/add_to_card.dart';
import 'package:food_ordering/utils/constant.dart';

import '../../add_to_card/providers/addCard_provider.dart';
import '../../home/providers/foodProvider.dart';
import '../model/food.dart';

final qty = StateProvider((ref) => 0);

class FoodDetail extends ConsumerWidget {
  const FoodDetail({super.key, this.food});
  final Food? food;
  static const String routerName = '/foodDetail';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
        duration: const Duration(seconds: 4),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 14),
                child: Icon(
                  FontAwesomeIcons.heart,
                  color: Colors.black,
                ),
              )
            ],
          ),
          body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(food!.img, height: 300),
                    Text(
                      food!.location,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          food!.name,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
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
                            horizontalBox(6),
                            Text(
                              ref.watch(qty).toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 20),
                            ),
                            horizontalBox(6),
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
                      ],
                    ),
                    verticalBox(8),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac enim ac mauris fermentum porta. Integer rhoncus sapien vel neque dictum, vitae lacinia nisi lacinia. Maecenas id enim sed nisi interdum gravida.",
                      style: TextStyle(
                          fontSize: 12, letterSpacing: 1, color: Colors.grey),
                    ),
                    verticalBox(10),
                    Text("₹ ${food!.price.toString()}",
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                    verticalBox(5),
                    Row(
                      children: [
                        const Text("Delivery Time",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                        horizontalBox(20),
                        const Icon(
                          FontAwesomeIcons.clock,
                          size: 15,
                        ),
                        horizontalBox(9),
                        const Text(
                          "30 Min",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    verticalBox(8),
                    const Text(
                      "Ingredients",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      food!.ingredients,
                      style: const TextStyle(fontSize: 14, letterSpacing: 1),
                    ),
                  ])),
          bottomSheet: BottomAppBar(
            color: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            notchMargin: 0,
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        onPressed: () {
                          ref.read(mycard.notifier).state.add(Food(
                              name: food!.name,
                              ingredients: food!.ingredients,
                              img: food!.img,
                              price: food!.price,
                              location: food!.location,
                              description: food!.description,
                              qty: ref.watch(qty)));
                          showToast("Added", context);
                        },
                        child: const Text("Add To Card"))),
                horizontalBox(20),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: const BorderSide(color: Colors.black))),
                      onPressed: () {},
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
