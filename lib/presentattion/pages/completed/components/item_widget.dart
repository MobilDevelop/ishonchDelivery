import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kuryer/infrastructure/models/copmpleted/completed_item.dart';
import 'package:kuryer/presentattion/assets/res/app_icons.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';

class CompletedItem extends StatelessWidget {
  const CompletedItem({
    super.key, required this.item, required this.type,
  });
  final CompltedItem item;
  final int type;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h10),
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h10),
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
            color: type==1?Colors.green:AppTheme.colors.red,
            width: 2
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
                  maxLines: 3,
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
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),
                    ),
                  ],
                ),
              ],
            ), 
            Column(
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
                          maxLines: 4,
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
                maxLines: 3,
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
                maxLines: 3,
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
            type==1? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr('delivery.time'),style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.primary.withOpacity(.7))),
              Text(item.deliveryDateTime,
                    style: AppTheme.data.textTheme.titleMedium!.copyWith(color: AppTheme.colors.primary)),
            ],
            ):Column(
              children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tr('delivery.reason'),style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.primary.withOpacity(.7))),
                  Expanded(
                    child: Text(item.cancelReason!,
                          textAlign: TextAlign.end,
                          style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.primary)),
                  ),
                ],
                ),
                Visibility(
                  visible: item.camcelComment.isNotEmpty,
                  child: Column(
                    children: [
                      Gap(ScreenSize.h10),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(tr('delivery.reasoncomment'),style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.primary.withOpacity(.7))),
                        Expanded(
                          child: Text(item.camcelComment,
                                textAlign: TextAlign.end,
                                style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.primary)),
                        ),
                      ],
                      ),
                    ],
                  ),
                ),
              ],
            )
            ],
            )      
          ],
        ),
      );
  }
}