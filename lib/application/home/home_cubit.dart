import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kuryer/application/home/home_state.dart';
import 'package:kuryer/presentattion/pages/completed/completed_page.dart';
import 'package:kuryer/presentattion/pages/deliver/deliver_page.dart';
import 'package:kuryer/presentattion/pages/user/user_page.dart';
import 'package:rive/rive.dart';

class HomeCubit extends Cubit<HomeState>{
    HomeCubit():super(HomeInitial());

    late SMIBool isMenuOpen; 

    bool isSideMenuclosed = true;
    bool isPress =true;

    int currentPage =0;
    
    List<Widget> views = [
      const DeliverPage(),
      const CompletedPage(),
      const UserPage()
    ];
    

    void isOpen(){
      isMenuOpen.value = !isMenuOpen.value;
      isSideMenuclosed = isMenuOpen.value;
          
      emit(HomeInitial());
    }
    
    void nextPage(String title){
      if(isPress){
        isPress =false;
        switch (title) {
        case "HOME":currentPage=0;break;
        case "REFRESH/RELOAD":currentPage=1;break;
        case "USER":currentPage=2;break;
      }
       isMenuOpen.value = !isMenuOpen.value;
      isSideMenuclosed = isMenuOpen.value;
      Future.delayed(const Duration(milliseconds: 1000),(){
        isPress =true;
        emit(HomeNextWiew());  
      });
      }
    }
  
}