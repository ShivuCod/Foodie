import 'package:dio/dio.dart';
import 'package:food_ordering/utils/hive_config.dart';


class DioInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String accessToken = HiveUser.getToken();

    if (accessToken != '' ) {
      options.headers['Authorization'] = 'Bearer $accessToken';
      options.headers['Content-Type']='application/json';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // on Response
    super.onResponse(response, handler);
  }
}