import 'package:dio/dio.dart';
import 'package:kuryer/domain/common/constants.dart';
import 'package:kuryer/infrastructure/models/completed/completed_item.dart';

import '../my_dio/my_dio.dart';

class CompletedServices{
    final Dio dio = Mydio().dio();
   
   Future<List<CompltedItem>> init(Map<String,dynamic> param)async{
    try {
       Response response = await dio.get(AppContatants.completed,queryParameters:param);
     return Future.value(completedItemFromMap(response.data['data']));
    } catch (e) {
      print(e);
      return Future.value([]);
    }
  }
}