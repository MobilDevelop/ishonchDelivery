import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kuryer/application/deliver/deliver_state.dart';
import 'package:kuryer/domain/provider/delivery_services.dart';
import 'package:kuryer/infrastructure/helper/helper.dart';
import 'package:kuryer/infrastructure/local_source/local_source.dart';
import 'package:kuryer/infrastructure/models/delivery_order/cancel_item.dart';
import 'package:kuryer/infrastructure/models/delivery_order/canceled.dart';
import 'package:kuryer/infrastructure/models/delivery_order/order_item.dart';
import 'package:kuryer/infrastructure/models/delivery_order/succes_item.dart';
class DeliverCubit extends Cubit<DeliverState>{
  DeliverCubit():super(DeliverInitial()){
     init();
  }
  bool loading = true;
  bool serviceConnect =true;
  bool internetConnect =true;


  final cancelCommit = TextEditingController();
  
  List<OrderItem> items =[];
  List<CancelItem> cancelItems =[];

  CancelItem? cancelItem;

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
  //   internetConnect=false;
  //  String jsonItems = await LocalSource.getInfo(key: "delivery_order");
  //  if(jsonItems.isNotEmpty){
  //   items.clear();
  //   items = orderItemMemoryFromMap(jsonDecode(jsonItems));
  //  }
  }
} on SocketException catch (_){
  internetConnect=false;
   String jsonItems = await LocalSource.getInfo(key: "delivery_order");
   if(jsonItems.isNotEmpty){
    items.clear();
    items = orderItemMemoryFromMap(jsonDecode(jsonItems));
    items.reversed.toList();
    print(items);
   }
}      
    loading =false;
    getCanceledItems();
   }
  }

  void getCanceledItems()async{
    if(internetConnect){
      cancelItems = await DeliveryService().getCenceledItems();
      LocalSource.putInfo(key: "canceledTitle", json: jsonEncode(cancelItems.map((element) => element.toJson()).toList()));
    }else{
      String canceledItemsJson = await LocalSource.getInfo(key: "canceledTitle");
      if(canceledItemsJson.isNotEmpty){
        cancelItems = cancelItemFromMap(jsonDecode(canceledItemsJson));
      }
    }
    emit(DeliverInitial());
  }

  void onAccept(OrderItem item)async{
    loading =true;
    emit(DeliverInitial());
    Position position = await Helper().getCurrentLocation();
    String formatDate = Helper.dateTimeFormat();
    if(internetConnect){
      String message = await DeliveryService().succesItem(SuccesItem(pruductId: item.id, dateTime: formatDate, latitude: position.latitude.toString(), longtude: position.longitude.toString()).sendToJson());
      emit(DeliveryMessage(message: message));
    }
    else{
      dynamic resendJson = await LocalSource.getInfo(key: 'resendItems');
       Map<String,dynamic> saveJson = SuccesItem(
          pruductId: item.id, 
          dateTime: formatDate, 
          latitude: position.latitude.toString(), 
          longtude: position.longitude.toString(),
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
          await LocalSource.putInfo(key: "resendItems", json: jsonEncode(jsonItems));
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
    items.clear();
    page=1;
    itemId=-1;
    serviceConnect=true;
    init();
  }



  void onCancel(OrderItem item)async{
    loading=true;
    emit(DeliverInitial());
    if(internetConnect){
      if(cancelItem==null){
      loading=false;
      emit(DeliveryMessage(message: "Bekor qilish sababini tanlamadingiz!"));
    }else{
    String respons = await DeliveryService().canceled(Canceled(productId: item.id, cancelId: cancelItem!.id,comment: cancelCommit.text.trim()).sendToJson());
     emit(DeliveryMessage(message: respons));
    items.clear();
    page=1;
    itemId=-1;
    serviceConnect=true;
    init();
    }
    }else{
     dynamic resendJson = await LocalSource.getInfo(key: 'resendCancelItems');
       Map<String,dynamic> saveJson = Canceled(
        productId: item.id, 
        cancelId: cancelItem!.id, 
        comment: cancelCommit.text.trim(),
        name: item.name,
        title: item.productTitle,
        amount: item.amount,
        cancelTitle: cancelItem!.title).saveToJson();
      
      if(resendJson.isNotEmpty){
        List jsonItems = jsonDecode(resendJson);
        if(jsonItems.isEmpty){
          await LocalSource.putInfo(key: "resendCancelItems", json: jsonEncode([saveJson]));
        }else{
          jsonItems.add(saveJson);  
          await LocalSource.putInfo(key: "resendCancelItems", json: jsonEncode(jsonItems));
        }
      }else{
         await LocalSource.putInfo(key: "resendCancelItems", json: jsonEncode([saveJson]));
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

  void onselectCancel(CancelItem canceled){
    cancelItem =canceled;
  }

  Future listRefresh()async{
   String checkUpload = await LocalSource.getInfo(key: "resendItems");
   String checkUpload1 = await LocalSource.getInfo(key: "resendCancelItems");
   if(checkUpload.isEmpty || checkUpload1.isEmpty){
    if(!loading){
    page=1;
    itemId=-1;
    serviceConnect=true;
    loading=true;
    items.clear();
    loading=true;
    emit(DeliverInitial());
    init();
   }
   }else{
    emit(DeliverNextSplash());
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