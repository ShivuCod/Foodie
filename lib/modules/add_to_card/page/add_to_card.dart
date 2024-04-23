import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ordering/modules/add_to_card/widget/item.dart';

import '../../home/providers/foodProvider.dart';
import '../providers/addCard_provider.dart';



class AddToCard extends ConsumerWidget {
  const AddToCard({super.key});
  static const String routerName = '/addToCard';
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final list = ref.watch(mycard);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        primary: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: const Icon(FontAwesomeIcons.gripVertical,
            color: Colors.black, size: 20),
        title: const Text(
          "Card",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            list.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child:const Center(
                      child: Text(
                        "Food Not Added",
                        style: TextStyle(fontSize: 20),
                      ),
                    ))
                : Column(
                    children: List.generate(list.length, (index) {
                      return ItemCard(food: list[index]);
                    }),
                  ),
            const Divider(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("Total Amount",
            //           style:
            //               TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            //       Text("₹ ${double.parse(list[0].price)}",
            //           style: const TextStyle(
            //               fontSize: 20,
            //               color: Colors.black,
            //               fontWeight: FontWeight.w500)),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: ElevatedButton.icon(
            //       icon: Icon(
            //         FontAwesomeIcons.arrowRight,
            //         size: 15,
            //       ),
            //       style: ElevatedButton.styleFrom(
            //           minimumSize: Size(150, 50),
            //           backgroundColor: Colors.black,
            //           foregroundColor: Colors.white,
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(16))),
            //       onPressed: () {},
            //       label: Text("Continue")),
            // )
          ],
        ),
      ),
    );
  }
}
