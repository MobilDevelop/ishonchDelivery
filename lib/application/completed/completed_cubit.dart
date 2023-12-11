import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/completed/completed_state.dart';
import 'package:kuryer/domain/provider/completed_services.dart';
import 'package:kuryer/infrastructure/local_source/local_source.dart';
import 'package:kuryer/infrastructure/models/copmpleted/completed_item.dart';

class CompletedCubit extends Cubit<CompletedState>{
  CompletedCubit():super(CompletedInitial()){
    init();
  }

  int page1 = 1;
  int page2 = 1;

  List<CompltedItem> itemsCompleted =[];
  List<CompltedItem> itemsCanceled =[];

  bool loading = true;
  bool serviceConnect =true;
  bool internetConnect =true;


  void init()async{
    if(serviceConnect){
      try {
  final result = await InternetAddress.lookup('example.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    internetConnect=true;
      List<CompltedItem>  pageItems = await CompletedServices().init("delivered",page1.toString());
     if(pageItems.isNotEmpty){
      itemsCompleted.addAll(pageItems);
      await LocalSource.putInfo(key: "completed", json: jsonEncode(itemsCompleted.map((item) => item.toJson()).toList()));
      page1++;
      pageItems.clear();
     }else{
      serviceConnect=false;
     }
  }
} on SocketException catch (_){
  internetConnect=false;
   String jsonItems = await LocalSource.getInfo(key: "completed");
   if(jsonItems.isNotEmpty){
    itemsCompleted.clear();
    itemsCompleted = completedItemMemoryFromMap(jsonDecode(jsonItems));
   }
}


try { 
  final result = await InternetAddress.lookup('example.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    internetConnect=true;
      List<CompltedItem>  pageItems = await CompletedServices().init("canceled",page2.toString());
     if(pageItems.isNotEmpty){
      itemsCanceled.addAll(pageItems);
      await LocalSource.putInfo(key: "canceled", json: jsonEncode(itemsCanceled.map((item) => item.toJson()).toList()));
      page2++;
      pageItems.clear();
     }else{
      serviceConnect=false;
     }
  }
} on SocketException catch (_){
  internetConnect=false;
   String jsonItems = await LocalSource.getInfo(key: "canceled");
   if(jsonItems.isNotEmpty){
    itemsCompleted.clear();
    itemsCompleted = completedItemMemoryFromMap(jsonDecode(jsonItems));
   }
}
    loading =false;
    emit(CompletedInitial());
   }
  }

  Future listRefresh()async{
    page1=1;
    page2=1;
    serviceConnect=true;
    loading=true;
    itemsCompleted.clear();
    emit(CompletedInitial());
    init();
  }
}