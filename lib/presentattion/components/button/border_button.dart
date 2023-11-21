import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as f_bounce;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';

class BorderButton extends StatelessWidget {
  const BorderButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width,
    this.borderColor,
    this.icon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double? width;
  final Color? borderColor;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    Widget current = Text(
      text,
      style: AppTheme.data.textTheme.bodyMedium
          ?.copyWith(color: borderColor ?? AppTheme.colors.primary),
    );

    if (icon != null) {
      current = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          current,
          Gap(ScreenSize.w12),
          SvgPicture.asset(
            icon!,
            color: borderColor ?? AppTheme.colors.text900,
            height: ScreenSize.h20,
          )
        ],
      );
    }

    return f_bounce.Bounce(
      onPressed: onPressed,
      duration: const Duration(milliseconds: 150),
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
            horizontal: icon != null ? 0 : ScreenSize.w24,
            vertical: ScreenSize.h12),
        decoration: BoxDecoration(
            color: borderColor == null
                ? AppTheme.colors.primary.withOpacity(0.04)
                : borderColor!.withOpacity(0.04),
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: borderColor ?? AppTheme.colors.primary,width: 1.5)),
        alignment: Alignment.center,
        child: current,
      ),
    );
  }
}
