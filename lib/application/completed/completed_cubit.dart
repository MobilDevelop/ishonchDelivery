  import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/completed/completed_state.dart';
import 'package:kuryer/domain/provider/completed_services.dart';
import 'package:kuryer/domain/provider/delivery_services.dart';
import 'package:kuryer/infrastructure/helper/helper.dart';
import 'package:kuryer/infrastructure/local_source/local_source.dart';
import 'package:kuryer/infrastructure/models/completed/completed_filter.dart';
import 'package:kuryer/infrastructure/models/completed/completed_item.dart';
import 'package:kuryer/infrastructure/models/delivery_order/delivery_filter.dart';
import 'package:kuryer/infrastructure/models/login/login_info.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CompletedCubit extends Cubit<CompletedState>{
  CompletedCubit():super(CompletedInitial()){
    init({});
  }

  int page1 = 1;
  int page2 = 1;

  final filterController = TextEditingController();

  final dateController = DateRangePickerController();

  List<CompltedItem> itemsCompleted =[];
  List<CompltedItem> itemsCanceled =[];
  List<DeliveryFilterItem> regions =[];

  CompletedFilter? filterItem;

  bool loading = true;
  bool serviceConnect =true;
  bool internetConnect =true;

  UserInfo? userInfo;


  void init(Map<String,dynamic> info)async{
    if(serviceConnect){
      try {
  final result = await InternetAddress.lookup('example.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    Map<String,dynamic> param = {
      "mode":"delivered",
      "page":page1.toString()
    };
    param.addAll(info);
    internetConnect=true;
      List<CompltedItem>  pageItems = await CompletedServices().init(param);
     if(pageItems.isNotEmpty){
      itemsCompleted.addAll(pageItems);
      await LocalSource.putInfo(key: "completed", json: jsonEncode(itemsCompleted.map((item) => item.toJson()).toList()));
      page1++;
      pageItems.clear();
     }else{
      serviceConnect=false;
     }
  }
   String json = await LocalSource.getInfo(key: 'userInfo');
    if(json.isNotEmpty){
      userInfo = UserInfo.fromJson(jsonDecode(json));
    }
    regions = await DeliveryService().regions(userInfo?.provinceId??"");
  

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
    Map<String,dynamic> param = {
      "mode":"canceled",
      "page":page2.toString()
    };
    param.addAll(info);
    internetConnect=true;
      List<CompltedItem>  pageItems = await CompletedServices().init(param);
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
  void onSelected(CompletedFilter filt ){
    filterItem = filt;
  }
  void onFilter(Map<String,dynamic> info){
    String startDate = dateController.selectedRange==null?"":Helper.dateFormat(dateController.selectedRange!.startDate);
    String endDate = dateController.selectedRange==null?"":Helper.dateFormat(dateController.selectedRange!.endDate);
    Map<String,dynamic> param = {
      "start_date":startDate,
      "end_date":endDate
    };
    param.addAll(info);
    page1=1;
    page2=1;
    serviceConnect=true;
    loading=true;
    itemsCompleted.clear();
    itemsCanceled.clear();
    emit(CompletedInitial());
    init(param);
  }

  Future listRefresh()async{
    page1=1;
    page2=1;
    serviceConnect=true;
    loading=true;
    itemsCompleted.clear();
    emit(CompletedInitial());
    init({});
  }
}