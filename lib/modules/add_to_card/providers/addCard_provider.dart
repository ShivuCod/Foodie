
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering/modules/add_to_card/model/addCardModel.dart';
import 'package:food_ordering/modules/add_to_card/sevices/addCard_service.dart';

final cardList=FutureProvider<List<Item>>((ref)async{
  List<Item> list=await AddCardService().getCardProducts();
  return list;
});
final mycard = StateProvider<List>((ref) => []);