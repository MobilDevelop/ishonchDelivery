import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/drawer/drawer_state.dart';
import 'package:kuryer/infrastructure/local_source/local_source.dart';
import 'package:kuryer/infrastructure/models/login/login_info.dart';
import 'package:kuryer/infrastructure/models/rive_models.dart';

class DrawerCubit extends Cubit<DrawerState>{
  DrawerCubit():super(DrawerInitial()){
    init();
  }

  RiveAsset selectedMenu = sideMenus.first;

  bool isPress = true;
  
  UserInfo? userInfo;

  void init()async{
     String json = await LocalSource.getInfo(key: 'userInfo');
    if(json.isNotEmpty){
      userInfo = UserInfo.fromJson(jsonDecode(json));
    }
  }

  void selectWindow(RiveAsset menu){
    selectedMenu = menu;
    emit(DrawerInitial());
  }
  
  void logOut()async{
    await LocalSource.clearProfile();
    emit(DrawerLogOut());
  }
}