import 'package:dio/dio.dart';
import 'package:kuryer/domain/common/constants.dart';
import 'package:kuryer/domain/my_dio/my_dio.dart';

class LoginServices{
   final Dio dio = Mydio().dio();
   
   Future getInfo(Map<String,dynamic> param)async{
    try {
       Response response = await dio.post(AppContatants.login,data: param);
     return Future.value(response.data['user']);
    } catch (e) {
      print(e);
      return Future.value({});
    }
  }
}