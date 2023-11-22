import 'package:dio/dio.dart';

import 'my_interceptor.dart';

class  Mydio{
  final _dio = Dio();
  Mydio(){
    _dio.interceptors.add(
      MyInterceptor());
  }
  Dio dio(){
    return _dio;
  }
}