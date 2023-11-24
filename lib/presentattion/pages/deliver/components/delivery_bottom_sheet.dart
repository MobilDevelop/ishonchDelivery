import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';
import 'package:kuryer/presentattion/components/button/border_button.dart';

class DeliveryBottomSheet extends StatelessWidget {
  const DeliveryBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 400.h,
    width: double.maxFinite,
    padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
    decoration: BoxDecoration(
      color: AppTheme.colors.white,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r))
    ),
    child: Column(
      children: [
          Gap(ScreenSize.h10),
             Container(
            height: ScreenSize.h4,
            width: 130.w,
            decoration: BoxDecoration(
              color: AppTheme.colors.black,
              borderRadius: BorderRadius.circular(4.r)
            ),
          ),
          Gap(ScreenSize.h32),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
      Expanded(
        child: 
        BorderButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: tr('search.bekor_qilish'),
            borderColor: AppTheme.colors.red),
      ),
    Gap(15.h),
      Expanded(
          child:BorderButton(
        onPressed: (){
          Navigator.pop(context);
         
          },
        text: tr('search.tasdiqlash'),
      )
    )
    ],
    ),     
     ],
    ),
   );
  }
}