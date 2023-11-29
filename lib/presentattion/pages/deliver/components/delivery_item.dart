import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kuryer/domain/common/constants.dart';
import 'package:kuryer/infrastructure/models/delivery_order/order_item.dart';
import 'package:kuryer/presentattion/assets/res/app_icons.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';
import 'package:kuryer/presentattion/components/button/border_button.dart';

class DeliveryItem extends StatelessWidget {
  const DeliveryItem({
    super.key, required this.press, required this.buttonVisible, required this.item, required this.pressCancel, required this.pressAccept,
  });
  final VoidCallback press;
  final VoidCallback pressCancel;
  final VoidCallback pressAccept;
  final bool buttonVisible;
  final OrderItem item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h10),
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h10),
        decoration: BoxDecoration(
          color: buttonVisible?Colors.grey.shade100:AppTheme.colors.white,
          boxShadow: [
            BoxShadow(
              color: AppTheme.colors.grey.withOpacity(.6),
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(7.w, 6.h)
            )
          ],
          border: Border.all(
            color: buttonVisible? AppTheme.colors.primary:AppTheme.colors.secondary,
            width: buttonVisible?1.5:.6
          ),
          borderRadius: BorderRadius.circular(15.r)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(item.name,
                  maxLines: buttonVisible?3:2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.primary))),
                Expanded(
                  flex: 1,
                  child: Text(item.id.toString(),
                  textAlign: TextAlign.end  ,
                  style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey))),
              ],
            ),
            Gap(ScreenSize.h8),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(item.productTitle,
                  maxLines: buttonVisible?4:2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.secondary))),
                  SvgPicture.asset(AppIcons.swap,height: ScreenSize.h18,color: AppTheme.colors.secondary,),
                Expanded(
                  child: Text("${item.amount} ta",
                  textAlign: TextAlign.end  ,
                  style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.secondary))),
              ],
            ),
            Gap(ScreenSize.h10),
            DottedLine(dashColor: AppTheme.colors.grey),
            Gap(ScreenSize.h10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tr("delivery.address"),style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.primary)),
                Gap(2.h),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.location,height:ScreenSize.h18,color: AppTheme.colors.primary),
                    Gap(ScreenSize.w6),
                    Expanded(
                      child: Text(item.address,
                            maxLines: buttonVisible?4:2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),
                    ),
                  ],
                ),
              ],
            ), 
            Visibility(
              visible: buttonVisible,
              child: Column(
              children: [
                Gap(ScreenSize.h10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr("delivery.orientation"),style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.primary)),
                    Row(
              children: [
                    SvgPicture.asset(AppIcons.mlocation,height:ScreenSize.h18,color: AppTheme.colors.primary),
                    Gap(ScreenSize.w6),
                    Expanded(
                      child: Text(item.orientation,
                            maxLines: buttonVisible?4:2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),
                    ),
              ],
            ),
                  ],
                ), 
            Gap(ScreenSize.h10),
            DottedLine(dashColor: AppTheme.colors.grey),
            Gap(ScreenSize.h10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(tr("delivery.phone"),
                  textAlign: TextAlign.start,
                  style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),
                  Text(item.phone,
                  maxLines: buttonVisible?3:2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.primary))
                  ],
                ),
                Gap(ScreenSize.h4),
                Visibility(
                  visible: item.addtionalPhone.isNotEmpty,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(tr("delivery.addtionalphone"),
                  textAlign: TextAlign.start,
                  style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),
                  Text(item.phone,
                  maxLines: buttonVisible?3:2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.primary))
                  ],
                )),
                Gap(ScreenSize.h10),
                Visibility(
                  visible: item.comment.isNotEmpty,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr("delivery.comment"),style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.primary)),
                      Expanded(child: Text(item.comment,
                      style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey))),
                    ],
                  ),
                ),
            Gap(ScreenSize.h8),
            DottedLine(dashColor: AppTheme.colors.grey),
            Gap(ScreenSize.h8),
                 Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
      Expanded(
        child: 
        BorderButton(
            onPressed: pressCancel,
            text: tr("delivery.cancel"),
            borderColor: AppTheme.colors.red),
      ),
    Gap(15.h),
      Expanded(
          child:BorderButton(
        onPressed: pressAccept,
        text: tr("delivery.accept"),
      )
    )
    ],
    ),     
              ],
            ))      
          ],
        ),
      ),
    );
  }
}