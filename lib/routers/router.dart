
import 'package:food_ordering/modules/add_to_card/page/add_to_card.dart';
import 'package:food_ordering/modules/FoodDetail/model/food.dart';
import 'package:food_ordering/modules/FoodDetail/page/foodDetail.dart';
import 'package:food_ordering/modules/auth/page/intro.dart';
import 'package:food_ordering/modules/auth/page/login.dart';
import 'package:food_ordering/modules/auth/page/signUp.dart';
import 'package:food_ordering/modules/home/page/bottomTabs.dart';
import 'package:food_ordering/modules/meals/page/Meals.dart';
import 'package:food_ordering/modules/profile/page/profile.dart';

import '../modules/home/page/home.dart';

class Routers {
  static final routes = {
    ScreenModel.routerName:(context)=>const ScreenModel(),
    HomePage.routerName: (context) => const HomePage(),
    IntroPage.routerName:(context)=>const IntroPage(),
    LoginPage.routerName:(context)=>const LoginPage(),
    SignUp.routerName:(context)=>const SignUp(),
    FoodDetail.routerName: (context) => FoodDetail(
          ),
    Meals.routerName: (context) => const Meals(),
    Profile.routerName: (context) => const Profile(),
    AddToCard.routerName: (context) => const AddToCard(),
  };
}
