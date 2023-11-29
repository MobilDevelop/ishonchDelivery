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

  int page = 1;

  List<CompltedItem> items =[];

  bool loading = true;
  bool serviceConnect =true;
  bool internetConnect =true;


  void init()async{
    if(serviceConnect){
      try {
  final result = await InternetAddress.lookup('example.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    internetConnect=true;
      List<CompltedItem>  pageItems = await CompletedServices().init("",page.toString());
     if(pageItems.isNotEmpty){
      items.addAll(pageItems);
      await LocalSource.putInfo(key: "completed", json: jsonEncode(items.map((item) => item.toJson()).toList()));
      page++;
      pageItems.clear();
     }else{
      serviceConnect=false;
     }
  }
} on SocketException catch (_){
  internetConnect=false;
   String jsonItems = await LocalSource.getInfo(key: "completed");
   if(jsonItems.isNotEmpty){
    items.clear();
    items = completedItemMemoryFromMap(jsonDecode(jsonItems));
   }
}
    loading =false;
    emit(CompletedInitial());
   }
  }

  Future listRefresh()async{
    page=1;
    serviceConnect=true;
    loading=true;
    items.clear();
    emit(CompletedInitial());
    init();
  }
}