
import 'package:flutter/material.dart';
import 'package:kuryer/presentattion/assets/res/app_icons.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';

class CarLoading extends StatelessWidget {
  const CarLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     height: double.maxFinite,
     width: double.maxFinite,
     color: AppTheme.colors.grey.withOpacity(.4),
     alignment: Alignment.center,
     padding: EdgeInsets.all(ScreenSize.h32),
     child: Image.asset(AppIcons.loading,fit: BoxFit.contain));
  }
}