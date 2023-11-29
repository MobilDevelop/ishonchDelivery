import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';
import 'package:kuryer/presentattion/components/button/border_button.dart';
import 'package:kuryer/presentattion/components/button/main_button.dart';

class DeliveryBottomSheet extends StatelessWidget {
  const DeliveryBottomSheet({
    super.key, required this.press,
  });
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Container(
    height: 400.h,
    width: double.maxFinite,
    padding: EdgeInsets.only(left: ScreenSize.w12,right: ScreenSize.w12,bottom: ScreenSize.h32),
    decoration: BoxDecoration(
      color: AppTheme.colors.white,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r))
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
            Column(
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
          Container(
            height: 70,
            width: double.maxFinite,
            color: Colors.green,
          ),
          Gap(ScreenSize.h32),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(tr("delivery.address"),style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.primary)),
               Gap(ScreenSize.h4),
               Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: AppTheme.colors.primary,
                    width: .6
                  )
                ),
                child: TextField(
                  maxLines: 5,
                ),
               ),
             ],
           )
              ],
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
      Expanded(
        child: 
        MainButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppTheme.colors.red,
            text: tr('delivery.cancel'),
            ),
      ),
    Gap(15.h),
      Expanded(
          child:MainButton(
        onPressed: (){
          press();
          Navigator.pop(context);
          },
        text: tr('delivery.accept'),
      )
    )
    ],
    ),     
     ],
    ),
   );
  }
}