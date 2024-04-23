import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering/modules/home/model/food.dart';
import 'package:food_ordering/modules/home/sevices/home_service.dart';

import '../../FoodDetail/model/food.dart';

final foodList=FutureProvider<List<Item>>((ref) async{
  List<Item> data =await HomeService().getData();
  return data;
});

