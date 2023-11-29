import 'package:dio/dio.dart';
import 'package:kuryer/domain/common/constants.dart';
import 'package:kuryer/domain/my_dio/my_dio.dart';
import 'package:kuryer/infrastructure/models/delivery_order/order_item.dart';

class DeliveryService{
     final Dio dio = Mydio().dio();
   
   Future<List<OrderItem>> init(String page)async{
    try {
       Response response = await dio.get(AppContatants.order,queryParameters: {"page":page});
     return Future.value(orderItemFromMap(response.data['data']));
    } catch (e) {
      print(e);
      return Future.value([]);
    }
  }

  Future succesItem(Map<String,dynamic> param)async{
    try {
      Response response = await dio.post(AppContatants.confirm,data: param);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}