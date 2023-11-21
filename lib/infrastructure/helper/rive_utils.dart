import 'package:rive/rive.dart';

class RiveUtils{
  static StateMachineController getRiveController(Artboard artboard,{stateMachinaName = "State Machine 1"}){
    StateMachineController? controller = StateMachineController.fromArtboard(artboard, stateMachinaName);
    artboard.addController(controller!);
    return controller;
  }
}