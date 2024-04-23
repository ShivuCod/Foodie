import 'package:dio/dio.dart';
import 'package:food_ordering/core.network/dio_interceptor.dart';
import 'package:food_ordering/modules/add_to_card/endpoints/addCard_endpoint.dart';
import 'package:food_ordering/modules/add_to_card/model/addCardModel.dart';

class AddCardService{
  late Dio dio;
  AddCardService(){
    dio=Dio();
    dio.interceptors.add(DioInterceptor());
  }
  Future<List<Item>> getCardProducts()async{
    Response response=await dio.get(AddCardEndPoint.addCardList);
    if(response.statusCode==200){
      List data=response.data["items"];
      List<Item> list=[];
      for(int i=0;i<data.length;i++){
        list.add(Item.fromMap(data[i]));
      }
      print("Sf");
      print(list);
      return list;
    }else{
      return [];
    }
  }
}