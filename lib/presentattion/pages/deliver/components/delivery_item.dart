import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuryer/domain/common/constants.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';

class DeliveryItem extends StatelessWidget {
  const DeliveryItem({
    super.key, required this.press,
  });
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: Duration(milliseconds: AppContatants.duration),
      onPressed: press,
      child: Container(
        height: 150.h,
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h10),
        decoration: BoxDecoration(
          color: AppTheme.colors.white,
          boxShadow: [
            BoxShadow(
              color: AppTheme.colors.grey.withOpacity(.6),
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(7.w, 6.h)
            )
          ],
          border: Border.all(
            color: AppTheme.colors.secondary,
            width: .6
          ),
          borderRadius: BorderRadius.circular(15.r)
        ),
      ),
    );
  }
}