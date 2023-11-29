import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kuryer/application/deliver/deliver_state.dart';
import 'package:kuryer/domain/provider/delivery_services.dart';
import 'package:kuryer/infrastructure/helper/helper.dart';
import 'package:kuryer/infrastructure/local_source/local_source.dart';
import 'package:kuryer/infrastructure/models/delivery_order/order_item.dart';
import 'package:kuryer/infrastructure/models/delivery_order/succes_item.dart';
import 'package:kuryer/infrastructure/models/universal/location.dart';
class DeliverCubit extends Cubit<DeliverState>{
  DeliverCubit():super(DeliverInitial()){
    init();
  }
  bool loading = true;
  bool serviceConnect =true;
  bool internetConnect =true;

  LocationObject? locationObject;
  
  List<OrderItem> items =[];

  int page =1;
  int itemId = -1;

  void init()async{
    if(serviceConnect){
      try {
  final result = await InternetAddress.lookup('example.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    // internetConnect=true;
    //   List<OrderItem> pageItems = await DeliveryService().init(page.toString());
    //  if(pageItems.isNotEmpty){
    //   items.addAll(pageItems);
    //   await LocalSource.putInfo(key: "delivery_order", json: jsonEncode(items.map((item) => item.toJson()).toList()));
    //   page++;
    //   pageItems.clear();
    //  }else{
    //   serviceConnect=false;
    //  }
    internetConnect=false;
   String jsonItems = await LocalSource.getInfo(key: "delivery_order");
   if(jsonItems.isNotEmpty){
    items.clear();
    items = orderItemMemoryFromMap(jsonDecode(jsonItems));
   }
  }
} on SocketException catch (_){
  internetConnect=false;
   String jsonItems = await LocalSource.getInfo(key: "delivery_order");
   if(jsonItems.isNotEmpty){
    items.clear();
    items = orderItemMemoryFromMap(jsonDecode(jsonItems));
   }
}
    loading =false;
    emit(DeliverInitial());
   }
  }

  void onAccept(OrderItem item)async{
    loading =true;
    emit(DeliverInitial());
    Position position = await Helper().getCurrentLocation();
    String formatDate = Helper.dateTimeFormat();
    if(internetConnect){
      dynamic respons = await DeliveryService().succesItem(SuccesItem(pruductId: item.id, dateTime: formatDate, latitude: locationObject!.latitude, longtude: locationObject!.longtude).sendToJson());
      print(respons);
    }
    else{
      dynamic resendJson = await LocalSource.getInfo(key: 'resendItems');
       Map<String,dynamic> saveJson = SuccesItem(
          pruductId: item.id, 
          dateTime: formatDate, 
          latitude: locationObject!.latitude, 
          longtude: locationObject!.longtude,
          name: item.name,
          title: item.productTitle,
          amount: item.amount
          ).saveToJson();
      if(resendJson.isNotEmpty){
        List jsonItems = jsonDecode(resendJson);
        if(jsonItems.isEmpty){
          await LocalSource.putInfo(key: "resendItems", json: jsonEncode([saveJson]));
        }else{
          jsonItems.add(saveJson);
          await LocalSource.putInfo(key: "resendItems", json: jsonEncode([jsonItems]));
        }
      }else{
         await LocalSource.putInfo(key: "resendItems", json: jsonEncode([saveJson]));
      }
      final tile = items.firstWhere((element) => element.id==item.id);
      tile.saveMemory ="save";
      items.removeWhere((element) => element.id==item.id);
      items.add(tile);
      await LocalSource.putInfo(key: "delivery_order", json: jsonEncode(items.map((element) => element.toJson()).toList()));
    }
    loading=false;
    emit(DeliverInitial());
  }

  void onCancel()async{
    
  }

  Future listRefresh()async{
   if(!loading){
     page=1;
    serviceConnect=true;
    loading=true;
      items.clear();
    emit(DeliverInitial());
    init();
   }
  }

  void onVisibleItem(int id){
    if(itemId==id){
      itemId=-1;
    }else{
      itemId = id;
    }
    emit(DeliverInitial());
  }
}
