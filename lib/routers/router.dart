import 'package:food_ordering/modules/AddtoCard/page/AddtoCard.dart';
import 'package:food_ordering/modules/FoodDetail/model/food.dart';
import 'package:food_ordering/modules/FoodDetail/page/foodDetail.dart';
import 'package:food_ordering/modules/auth/page/intro.dart';
import 'package:food_ordering/modules/home/page/bottomTabs.dart';
import 'package:food_ordering/modules/meals/page/Meals.dart';
import 'package:food_ordering/modules/profile/page/profile.dart';

import '../modules/home/page/home.dart';

class Routers {
  static final routes = {
    ScreenModel.routerName:(context)=>const ScreenModel(),
    HomePage.routerName: (context) => const HomePage(),
    IntroPage.routerName:(context)=>const IntroPage(),
    FoodDetail.routerName: (context) => FoodDetail(
            food: Food(
          name: 'Burger',
          ingredients: 'Dough, cheese, tomato sauce, toppings',
          img: 'assets/burger.png',
          price: 89.0,
          location: 'Italian Restaurant',
          description: 'Delicious pizza with various toppings.',
              qty: 1
        )),
    Meals.routerName: (context) => const Meals(),
    Profile.routerName: (context) => const Profile(),
    AddToCard.routerName: (context) => const AddToCard(),
  };
}
