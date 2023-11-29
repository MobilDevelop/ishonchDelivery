import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/deliver/deliver_state.dart';
import 'package:kuryer/domain/provider/delivery_services.dart';
import 'package:kuryer/infrastructure/helper/helper.dart';
import 'package:kuryer/infrastructure/local_source/local_source.dart';
import 'package:kuryer/infrastructure/models/delivery_order/order_item.dart';
import 'package:kuryer/infrastructure/models/delivery_order/succes_item.dart';
import 'package:kuryer/infrastructure/models/universal/location.dart';
import 'package:location/location.dart';

class DeliverCubit extends Cubit<DeliverState>{
  DeliverCubit():super(DeliverInitial()){
    init();
  }
  bool loading = true;
  bool serviceConnect =true;
  bool internetConnect =true;

  Location location = Location();

  LocationObject? locationObject;
  
  List<OrderItem> items =[];

  int page =1;
  int itemId = -1;

  void init()async{
    if(serviceConnect){
      try {
  final result = await InternetAddress.lookup('example.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    internetConnect=true;
      List<OrderItem> pageItems = await DeliveryService().init(page.toString());
     if(pageItems.isNotEmpty){
      items.addAll(pageItems);
      await LocalSource.putInfo(key: "delivery_order", json: jsonEncode(items.map((item) => item.toJson()).toList()));
      page++;
      pageItems.clear();
     }else{
      serviceConnect=false;
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

  void onAccept(int productId)async{
    locationObject = await Helper().getCurrentLocation(location);
    String formatDate = Helper.dateTimeFormat();
    dynamic respons = await DeliveryService().succesItem(SuccesItem(pruductId: productId, dateTime: formatDate, latitude: locationObject!.latitude, longtude: locationObject!.longtude).toJson());
    print(respons);
  }

  void onCancel()async{
    
  }

  Future listRefresh()async{
    page=1;
    serviceConnect=true;
    loading=true;
      items.clear();
    emit(DeliverInitial());
    init();
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
