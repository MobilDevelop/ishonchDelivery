import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kuryer/infrastructure/models/delivery_order/canceled.dart';
import 'package:kuryer/presentattion/assets/res/app_icons.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';

class ItemWidgetCanceled extends StatelessWidget {
  const ItemWidgetCanceled({
    super.key, required this.item,
  });
 final Canceled item;
  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h10),
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h10),
      decoration: BoxDecoration(
        color: AppTheme.colors.background,
        border: Border.all(
          color: AppTheme.colors.primary
        ),
        borderRadius: BorderRadius.circular(10.r),
       boxShadow: [
            BoxShadow(
              color: AppTheme.colors.grey.withOpacity(.6),
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(6.w, 8.h)
            )
          ],
      ),
      child: Column(
        children: [
                 Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(item.name!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.primary))),
                Expanded(
                  flex: 1,
                  child: Text(item.cancelId.toString(),
                  textAlign: TextAlign.end  ,
                  style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey))),
              ],
            ),
            Gap(ScreenSize.h8),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(item.title!,
                  maxLines: 4,
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
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(tr("splash.reason"),style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.primary)),
                      Text(item.cancelTitle.toString(),
                      style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),
                    ],
                  ),
            Gap(ScreenSize.h6),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(tr("splash.comment"),style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.primary)),
                      Text(item.comment.toString(),
                      style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),
                    ],
                  ),      
        ],
      ),
    );
  }
} 