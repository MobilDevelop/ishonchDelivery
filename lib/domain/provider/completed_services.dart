import 'package:dio/dio.dart';
import 'package:kuryer/domain/common/constants.dart';
import 'package:kuryer/infrastructure/models/copmpleted/completed_item.dart';

import '../my_dio/my_dio.dart';

class CompletedServices{
    final Dio dio = Mydio().dio();
   
   Future<List<CompltedItem>> init(String mode,String page)async{
    try {
       Response response = await dio.get(AppContatants.completed,queryParameters: {"mode":mode,"page":page});
     return Future.value(completedItemFromMap(response.data['data']));
    } catch (e) {
      print(e);
      return Future.value([]);
    }
  }
}