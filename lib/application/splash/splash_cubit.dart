import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit():super(SplashInitial()){
    init();
    }

  void init()async{
      Future.delayed(const Duration(seconds: 4),(){
        emit(SplashNextHome());
      });
  }
}