import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuryer/infrastructure/models/rive_models.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';
import 'package:rive/rive.dart';

class RivWidget extends StatelessWidget {
  const RivWidget({
    super.key, required this.menu, required this.press, required this.riveonInit, required this.isActive,
  });
  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
                padding: EdgeInsets.only(left: ScreenSize.w10),
                child: Divider(
                  color: AppTheme.colors.background,
                  height: 1,
                ),
              ),
        Stack(
          alignment: Alignment.center,
          children: [
             AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              height: 42.h,
              width: isActive? 230.w:0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.colors.secondary,
                  borderRadius: BorderRadius.circular(12.r)
                ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 25.h,
                width: 25.h,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveonInit,
                ),
              ),
              title: Text(menu.title,style: AppTheme.data.textTheme.displaySmall!.copyWith(color: AppTheme.colors.white12)),
            ),
          ],
        ),
      ],
    );
  }
}