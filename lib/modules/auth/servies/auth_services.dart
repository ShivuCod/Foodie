
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_ordering/modules/auth/endpoints/auth_endpoint.dart';
import 'package:food_ordering/modules/auth/model/user.dart';
import 'package:food_ordering/utils/hive_config.dart';



class AuthService {
  Dio dio=Dio();

  Future<bool> login(String email,String password) async {
   Response response=await dio.post(AuthEndpoint.loginApi,data: {
     "identity":email,
     "password":password
   });
   if(response.statusCode==200){
     final data=jsonDecode(response.data);
     print(data);
     HiveUser.setToken(data["token"]);
     return true;
   }else{
     return false;
   }

  }

  Future<bool> signUp(User user)async{
    Response response=await dio.post(AuthEndpoint.signUp,data: user.toJson());
    if(response.statusCode==200){
      final data=jsonDecode(response.data);
      print(data);
      // HiveUser.setToken(data["token"]);
      return true;
    }else{
      return false;
    }
  }
}
