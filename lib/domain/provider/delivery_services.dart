import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kuryer/domain/common/constants.dart';
import 'package:kuryer/domain/my_dio/my_dio.dart';
import 'package:kuryer/infrastructure/models/delivery_order/cancel_item.dart';
import 'package:kuryer/infrastructure/models/delivery_order/delivery_filter.dart';
import 'package:kuryer/infrastructure/models/delivery_order/order_item.dart';

class DeliveryService{
     final Dio dio = Mydio().dio();
   
   Future<List<OrderItem>> init(Map<String,dynamic> param)async{
    try {
       Response response = await dio.get(AppContatants.order,queryParameters:param);
     return Future.value(orderItemFromMap(response.data['data']));
    } catch (e) {
      print(e);
      return Future.value([]);
    }
  }

  Future<String> succesItem(Map<String,dynamic> param)async{
    try {
      Response response = await dio.post(AppContatants.confirm,data: {'data':[param]});
      return Future.value(response.data['message']);
    } catch (e) {
     return Future.value(tr('error.canceled1'));
    }
  }

  Future<List<CancelItem>> getCenceledItems()async{
    try {
      Response response = await dio.get(AppContatants.canceledItems);
      return Future.value(cancelItemFromMap(response.data['data']));
    } catch (e) {
      return Future.value([]);
    }
  }
  Future<String> canceled(Map<String,dynamic> param)async{
    try {
       Response response = await dio.post(AppContatants.canceled,data: {'data':[param]});
       return Future.value(response.data['message']);
    } catch (e) {
      return Future.value(tr('error.canceled'));
    }
  }

  Future<List<DeliveryFilterItem>> regions(String id)async{
    try {
      Response response = await dio.get(AppContatants.region+id);
      return Future.value(deliveryFilterRegionsFromMap(response.data));
    } catch (e) {
      return Future.value([]);
    }
  }

  Future<List<DeliveryFilterItem>> villages(String id)async{
    try {
      Response response = await dio.get(AppContatants.village+id);
      return Future.value(deliveryFilterVillageFromMap(response.data));
    } catch (e) {
      return Future.value([]);
    }
  }
}