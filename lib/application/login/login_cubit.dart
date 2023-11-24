import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/login/login_state.dart';
import 'package:kuryer/domain/provider/login_services.dart';
import 'package:kuryer/infrastructure/local_source/local_source.dart';
import 'package:kuryer/infrastructure/models/login/login_send.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitial());
  
  bool loading = false;
  
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  

  void loginChekc()async{
    if(!loading){
    String username = userNameController.text.trim();
    String password = passwordController.text.trim(); 
     if(username.isEmpty || password.isEmpty){
        emit(LoginError(msg: tr('login_page.error')));
     }else{
      loading =true;
    emit(LoginInitial());
    dynamic userInfo = await LoginServices().getInfo(LoginSend(login: username, password: password).toJson());
     if(userInfo.isNotEmpty){
      LocalSource.putInfo(key: 'userInfo',json: jsonEncode(userInfo));
      emit(LoginNextHome());
     }else{
      loading =false;
    emit(LoginInitial());
     }
     }
    }
  }
}