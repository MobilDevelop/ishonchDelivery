// ignore_for_file: deprecated_member_use
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kuryer/infrastructure/local_source/local_source.dart';

class MyInterceptor extends Interceptor{
  
  MyInterceptor();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err.response);
    EasyLoading.showInfo(err.response!.data.toString());
    if (err.response?.statusCode == 503) {
      EasyLoading.showInfo(tr('universal.error'));
      LocalSource.clearProfile();
    }
    super.onError(err, handler);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Content-Type'] = 'application/json; charset=UTF-8';
    options.headers['Accept'] = 'application/json; charset=UTF-8'; 
    options.headers['Authorization'] = await LocalSource.getInfo(key: 'auth');
    options.baseUrl = dotenv.env['mainUrl']!;
    super.onRequest(options, handler);
  }
}