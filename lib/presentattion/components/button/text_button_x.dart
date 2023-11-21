import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';

class TextButtonX extends StatelessWidget {
  const TextButtonX({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.withUnderLine = false,
    this.rightIcon,
    this.leftIcon,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color? textColor;
  final bool withUnderLine;
  final String? rightIcon;
  final String? leftIcon;
  @override
  Widget build(BuildContext context) {
    TextStyle? style =
        AppTheme.data.textTheme.titleMedium?.copyWith(color: textColor);

    if (withUnderLine) {
      style = AppTheme.data.textTheme.labelLarge?.copyWith(
        shadows: [
          Shadow(
              color: textColor ?? AppTheme.colors.primary,
              offset: const Offset(0, -5))
        ],
        color: Colors.transparent,
        decoration: TextDecoration.underline,
        decorationColor: textColor ?? AppTheme.colors.primary,
        decorationThickness: 1,
      );
    }

    Widget current = Text(
      text,
      style: style,
    );

    if (rightIcon != null || leftIcon != null) {
      current = Container(
        width: double.maxFinite,
        height: 55.h,
        color: AppTheme.colors.secondary,
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.w4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (leftIcon != null) ...[
                  Padding(
                    padding: withUnderLine
                        ? EdgeInsets.only(bottom: ScreenSize.h8)
                        : EdgeInsets.zero,
                    child: SvgPicture.asset(
                      leftIcon!,
                      width: ScreenSize.w24,
                      height: ScreenSize.w24,
                      fit: BoxFit.cover,
                      color: textColor,
                    ),
                  ),
                  Gap(ScreenSize.w20),
                ],
                current,
              ],
            ),
            if (rightIcon != null) ...[
              Padding(
                padding: withUnderLine
                    ? EdgeInsets.only(bottom: ScreenSize.h8)
                    : EdgeInsets.zero,
                child: SvgPicture.asset(
                  rightIcon!,
                  width: ScreenSize.w24,
                  height: ScreenSize.w24,
                  fit: BoxFit.cover,
                  color: textColor,
                ),
              )
            ]
          ],
        ),
      );
    }

    return Bounce(
      onPressed: onPressed,
      duration: const Duration(milliseconds: 120),
      child: current,
    );
  }
}
