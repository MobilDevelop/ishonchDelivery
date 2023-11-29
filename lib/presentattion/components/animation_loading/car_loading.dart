import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kuryer/presentattion/assets/res/app_icons.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';

class CarLoading extends StatelessWidget {
  const CarLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        child: BackdropFilter(
             filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
             child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(ScreenSize.h32),
              child: Image.asset(AppIcons.loading,fit: BoxFit.contain)),
             ),
      );
  }
}