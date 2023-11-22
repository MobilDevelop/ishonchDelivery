import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/login/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitial());
  
  bool loading = false;

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();


  void loginChekc()async{
    if(!loading){
      loading =!loading;
    emit(LoginInitial());
    Future.delayed(const Duration(seconds: 1),(){
      emit(LoginNextHome());
    });
    }
  }
}