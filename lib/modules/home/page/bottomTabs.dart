
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ordering/modules/AddtoCard/page/AddtoCard.dart';
import 'package:food_ordering/modules/home/page/home.dart';
import 'package:food_ordering/modules/profile/page/profile.dart';

import '../../../utils/theme.dart';
import '../../meals/page/Meals.dart';

// page index ex 0 for home
final currentPage = StateProvider((ref) => 0);

class ScreenModel extends ConsumerWidget {
  const ScreenModel({Key? key}) : super(key: key);
static const String routerName = '/mainScreen';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(currentPage);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: IndexedStack(
          index: page,
          children:  [
            HomePage(),
            Meals(),
            AddToCard(),
            Profile(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: 60,
        color: cardColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildActivLabel(
              iconData: FontAwesomeIcons.house,
              page: 0,
              label: "Home",
              currentPage: page ,
              onTap: () => ref.read(currentPage.notifier).state = 0,
            ),
            buildActivLabel(
              iconData: FontAwesomeIcons.utensils,
              page: 1,
              label: "Meals",
              currentPage: page ,
              onTap: () => ref.read(currentPage.notifier).state = 1,
            ),
            buildActivLabel(
              iconData: FontAwesomeIcons.cartShopping,
              page: 2,
              label: "My Card",
              currentPage: page ,
              onTap: () => ref.read(currentPage.notifier).state = 2,
            ),
            buildActivLabel(
              iconData: FontAwesomeIcons.user,
              page: 3,
              label: "Account",
              currentPage: page ,
              onTap: () => ref.read(currentPage.notifier).state = 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildActivLabel({
    required IconData iconData,
    required int page,
    required int currentPage,
    required String label,
    required void Function() onTap,
  }) =>
      InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          child: Row(
            children: [
              Icon(
                iconData,
                size: 20,
                color: page == currentPage ? Colors.red : Colors.grey,
              ),

              if(page==currentPage) Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: page == currentPage ? Colors.red : Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
