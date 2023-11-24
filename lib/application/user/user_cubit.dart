import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/user/user_state.dart';
import 'package:kuryer/infrastructure/local_source/local_source.dart';
import 'package:kuryer/infrastructure/models/login/login_info.dart';

class UserCubit extends Cubit<UserState>{
  UserCubit():super(UserInitial()){
    getInfo();
  }

  UserInfo? userInfo;

  void getInfo()async{
    String json = await LocalSource.getInfo(key: 'userInfo');
    if(json.isNotEmpty){
      userInfo = UserInfo.fromJson(jsonDecode(json));
      emit(UserInitial());
    }
  }
}