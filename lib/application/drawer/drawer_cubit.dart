import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/drawer/drawer_state.dart';
import 'package:kuryer/infrastructure/models/rive_models.dart';

class DrawerCubit extends Cubit<DrawerState>{
  DrawerCubit():super(DrawerInitial());

  RiveAsset selectedMenu = sideMenus.first;

  bool isPress = true;

  void selectWindow(RiveAsset menu){
    selectedMenu = menu;
    emit(DrawerInitial());
  }
}