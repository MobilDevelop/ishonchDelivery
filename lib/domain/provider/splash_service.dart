import 'package:dio/dio.dart';
import 'package:kuryer/domain/common/constants.dart';
import 'package:kuryer/domain/my_dio/my_dio.dart';

class SplashServices{
   final Dio dio = Mydio().dio();
   
   Future sendSuccesItem(Map<String,dynamic> param)async{
    try {
       Response response = await dio.post(AppContatants.confirm,data: param);
     return Future.value(response.data['message']);
    } catch (e) {
      print(e);
      return Future.value("");
    }
  }

  Future sendCancelItem(Map<String,dynamic> param)async{
    try {
       Response response = await dio.post(AppContatants.canceled,data: param);
     return Future.value(response.data['message']);
    } catch (e) {
      print(e);
      return Future.value("");
    }
  }
}