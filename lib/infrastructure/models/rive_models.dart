import 'package:easy_localization/easy_localization.dart';
import 'package:kuryer/presentattion/assets/res/app_icons.dart';
import 'package:rive/rive.dart';

class RiveAsset{
  final String artboard;
  final String src;
  final String stateMachineName;
  final String title;
  SMIBool? input;

  RiveAsset({
    required this.src,
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input
  });

  set setInput(SMIBool status){
    input = status;
  }

}
List<RiveAsset> sideMenus = [
  RiveAsset(src: AppIcons.icons, artboard: "HOME", stateMachineName: "HOME_interactivity", title: tr('drawer.assignment')),
  RiveAsset(src: AppIcons.icons, artboard: "REFRESH/RELOAD", stateMachineName: 'RELOAD_Interactivity', title: tr('drawer.completed')),
  RiveAsset(src: AppIcons.icons, artboard: "USER", stateMachineName: 'USER_Interactivity', title: tr('drawer.user')),
];