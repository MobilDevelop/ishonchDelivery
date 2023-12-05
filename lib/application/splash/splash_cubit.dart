import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/splash/splash_state.dart';
import 'package:kuryer/domain/provider/splash_service.dart';
import 'package:kuryer/infrastructure/local_source/local_source.dart';
import 'package:kuryer/infrastructure/models/delivery_order/canceled.dart';
import 'package:kuryer/infrastructure/models/delivery_order/succes_item.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit():super(SplashInitial()){
    init();
    }
    String userInfoJson="";
    
    bool resendInfo =false;
    bool loading = false;

    List<SuccesItem> succesItem = [];
    List<Canceled> canceledItems = [];
  void init()async{
      Future.delayed(const Duration(seconds: 4),()async{
         dynamic resendJsonSucces = await LocalSource.getInfo(key: 'resendItems');
         dynamic resendJsonCancel = await LocalSource.getInfo(key: 'resendCancelItems');
        if(resendJsonSucces.isEmpty){
         if(resendJsonCancel.isEmpty){
          userInfoJson = await LocalSource.getInfo(key: 'userInfo');
        if(userInfoJson.isNotEmpty){
          emit(SplashNextHome());
        }else{
          emit(SplashNextLogin());
        }
         }else{
          resendInfo=true;
          canceledItems = canceledFromMap(jsonDecode(resendJsonCancel));
          emit(SplashInitial());
         }
        }else{
        resendInfo=true;
        succesItem = saveItemFromMap(jsonDecode(resendJsonSucces));
        if(resendJsonCancel.isNotEmpty){
          canceledItems = canceledFromMap(jsonDecode(resendJsonCancel));
          }
         emit(SplashInitial());
        }
      });
  }


  void uploadItems()async{
    loading =true;
    emit(SplashInitial());
    if(succesItem.isNotEmpty){
     String message1 = await SplashServices().sendSuccesItem({'data':succesItem.map((element) => element.sendToJson()).toList()});
     if(message1.isNotEmpty){
        LocalSource.putInfo(key: "resendItems", json: null);
        succesItem.clear();
        emit(SplashError(message: message1));
     }else{
      emit(SplashError(message: "Qandaydir hatolik yuz berdi"));
     }
     if(canceledItems.isNotEmpty){
      String message2 = await SplashServices().sendCancelItem({'data':canceledItems.map((element) => element.sendToJson()).toList()});
      if(message2.isNotEmpty){
        LocalSource.putInfo(key: "resendCancelItems", json: null);
        canceledItems.clear();
        emit(SplashError(message: message2));
      }else{
         emit(SplashError(message: "Qandaydir hatolik yuz berdi"));
      }
     }
    }else{
       String message2 = await SplashServices().sendCancelItem({'data':canceledItems.map((element) => element.sendToJson()).toList()});
      if(message2.isNotEmpty){
        LocalSource.putInfo(key: "resendCancelItems", json: null);
        canceledItems.clear();
        emit(SplashError(message: message2));
      }else{
         emit(SplashError(message: "Qandaydir hatolik yuz berdi"));
      }
    }
    if(succesItem.isEmpty && canceledItems.isEmpty){
      emit(SplashNextHome());
    }else{
      loading =false;
      emit(SplashInitial());
    }
    
  }
    
  void cancel(){
    emit(SplashNextHome());
  }
}