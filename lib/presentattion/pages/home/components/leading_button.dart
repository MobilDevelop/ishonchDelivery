import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuryer/presentattion/assets/res/app_icons.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';
import 'package:rive/rive.dart';

class LeadingButton extends StatelessWidget {
  const LeadingButton({
    super.key, required this.press, required this.riveOnInit,
  });

  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
         height: 40.h, 
         width: 40.h,
         margin: EdgeInsets.only(left: 12.w),
         decoration: BoxDecoration(
           shape: BoxShape.circle,
           color: AppTheme.colors.white,
           border: Border.all(
             color: AppTheme.colors.primary,
             width: .5
           ),
           boxShadow: [
           BoxShadow(
             color: Colors.black26,
             offset: Offset(3.h,5.w),
             blurRadius: 8
           )
           ]
         ),
         child: RiveAnimation.asset(AppIcons.menu_button,
          onInit: riveOnInit
         ),
        ),
      ),
    );
  }
}