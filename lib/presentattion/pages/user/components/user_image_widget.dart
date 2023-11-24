import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuryer/presentattion/assets/res/app_icons.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';

class UserIconWidget extends StatelessWidget {
  const UserIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 80.h,
      margin: EdgeInsets.only(bottom: ScreenSize.h10),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.colors.primary
        ),
        shape: BoxShape.circle,
        boxShadow: [
         BoxShadow(
        color: AppTheme.colors.grey.withOpacity(.6),
        blurRadius: 10,
        spreadRadius: 5,
       offset: Offset(5.w, 8.h)
          )
         ],
      ),
      child: ClipRRect(
       borderRadius: BorderRadius.circular(40.h), 
        child: Image.asset(AppIcons.curier,fit: BoxFit.cover)),
    );
  }
}