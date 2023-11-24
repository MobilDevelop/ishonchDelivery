import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/splash/splash_state.dart';
import 'package:kuryer/infrastructure/local_source/local_source.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit():super(SplashInitial()){
    init();
    }
    String userInfoJson="";
  void init()async{
      Future.delayed(const Duration(seconds: 4),()async{
         userInfoJson = await LocalSource.getInfo(key: 'userInfo');
        if(userInfoJson.isNotEmpty){
          emit(SplashNextHome());
        }else{
          emit(SplashNextLogin());
        }
      });
  }
}