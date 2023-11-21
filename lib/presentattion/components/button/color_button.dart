import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as f_bounce;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width,
    this.borderColor,
    this.icon,
    this.backgroundColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double? width;
  final Color? borderColor;
  final Color? backgroundColor;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    Widget current = Text(
      text,
      style: AppTheme.data.textTheme.titleSmall?.copyWith(
          color: backgroundColor == null
              ? AppTheme.colors.primary
              : AppTheme.colors.secondary),
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
          )
        ],
      );
    }

    return f_bounce.Bounce(
      onPressed: onPressed,
      duration: const Duration(milliseconds: 150),
      child: Container(
        width: width,
        margin: EdgeInsets.symmetric(horizontal: ScreenSize.w4),
        padding: EdgeInsets.symmetric(
            horizontal: icon != null ? 0 : ScreenSize.w4,
            vertical: ScreenSize.h12),
        decoration: BoxDecoration(
            color: backgroundColor ?? AppTheme.colors.secondary,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: borderColor ?? AppTheme.colors.primary)),
        alignment: Alignment.center,
        child: current,
      ),
    );
  }
}
