import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_ordering/core.network/dio_interceptor.dart';
import 'package:food_ordering/modules/home/endpoints/home_endpoint.dart';
import 'package:food_ordering/modules/home/model/food.dart';

import '../../FoodDetail/model/food.dart';

class HomeService{
  late final Dio _dio;
  HomeService(){
    _dio=Dio();
    _dio.interceptors.add(DioInterceptor());
  }

  Future<List<Item>> getData()async{
    final response=await _dio.get(HomeEndPoint.foodDetailApi);
    if(response.statusCode==200){
      List data=response.data["items"];
      List<Item> foodList=[];
      for(int i=0;i<data.length;i++){
        foodList.add(Item.fromMap(data[i]));
      }
      return foodList;

    }else{
      print(response);
     return [];
    }
  }

}