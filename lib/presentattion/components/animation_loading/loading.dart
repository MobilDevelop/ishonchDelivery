import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kuryer/infrastructure/helper/helper.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});
  @override
  Widget build(BuildContext context) {
    Widget current = Container();
      int index = Helper.randomNumber(); 
     switch (index) {
       case 0: current= Center(child: LoadingAnimationWidget.dotsTriangle(color: AppTheme.colors.primary, size: 120));break;
       case 1:current = Center(child: LoadingAnimationWidget.waveDots(color: AppTheme.colors.primary, size: 120));break;
       case 2:current = Center(child: LoadingAnimationWidget.inkDrop(color: AppTheme.colors.primary, size: 120));break;
       case 3:current = Center(child: LoadingAnimationWidget.threeRotatingDots(color: AppTheme.colors.primary, size: 120));break;
       case 4:current = Center(child: LoadingAnimationWidget.staggeredDotsWave(color: AppTheme.colors.primary, size: 120));break;
       case 5:current = Center(child: LoadingAnimationWidget.fourRotatingDots(color: AppTheme.colors.primary, size: 120));break;
       case 6:current = Center(child: LoadingAnimationWidget.fallingDot(color: AppTheme.colors.primary, size: 120));break;
       case 7:current = Center(child: LoadingAnimationWidget.prograssiveDots(color: AppTheme.colors.primary, size: 120));break;
       case 8:current = Center(child: LoadingAnimationWidget.threeArchedCircle(color: AppTheme.colors.primary, size: 120));break;
       case 9:current = Center(child: LoadingAnimationWidget.bouncingBall(color: AppTheme.colors.primary, size: 120));break;
       case 10:current = Center(child: LoadingAnimationWidget.hexagonDots(color: AppTheme.colors.primary, size: 120));break;
       case 11:current = Center(child: LoadingAnimationWidget.beat(color: AppTheme.colors.primary, size: 120));break;
       case 12:current = Center(child: LoadingAnimationWidget.twoRotatingArc(color: AppTheme.colors.primary, size: 120));break;
       case 13:current = Center(child: LoadingAnimationWidget.horizontalRotatingDots(color: AppTheme.colors.primary, size: 120));break;
       case 14:current = Center(child: LoadingAnimationWidget.newtonCradle(color: AppTheme.colors.primary, size: 120));break;
       case 15:current = Center(child: LoadingAnimationWidget.stretchedDots(color: AppTheme.colors.primary, size: 120));break;
       case 16:current = Center(child: LoadingAnimationWidget.halfTriangleDot(color: AppTheme.colors.primary, size: 120));break;
     }
     return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: ClipRect(
        child: BackdropFilter(
             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
             child: current,
             ),
      ),
     );
  }
}