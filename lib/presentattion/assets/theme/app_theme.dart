import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'base_colors.dart';
import 'light_mode_colors.dart';


class AppTheme {
  /// App theme colors
  static late BaseColors colors;

  /// Current app theme mode
  static late ThemeMode themeMode;

  /// App theme data
  static late ThemeData data;

  static Future<void> init() async {
    themeMode = ThemeMode.light;
    colors = _getThemeColors();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    final textTheme = TextTheme(
      headline1: TextStyle(
        fontSize: 20.sp,
        color: colors.text900,
        fontWeight: FontWeight.w700,
      ),
      headline3: TextStyle(
        fontSize: 20.sp,
        color: colors.text900,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        fontSize: 18.sp,
        color: colors.text900,
        fontWeight: FontWeight.w700,
      ),
      headline5: TextStyle(
        fontSize: 24.sp,
        color: colors.text900,
        fontWeight: FontWeight.w700,
      ),
      subtitle1: TextStyle(
        fontSize: 16.sp,
        color: colors.text900,
        fontWeight: FontWeight.w700,
      ),
      subtitle2: TextStyle(
        fontSize: 16.sp,
        color: colors.text900,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        fontSize: 14.sp,
        color: colors.text900,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: TextStyle(
        fontSize: 14.sp,
        color: colors.text900,
        fontWeight: FontWeight.w400,
      ),
      button: TextStyle(
        fontSize: 14.sp,
        color: colors.text900,
        fontWeight: FontWeight.w600,
      ),
      overline: TextStyle(
        fontSize: 12.sp,
        color: colors.text900,
        fontWeight: FontWeight.w400,
      ),
      caption: TextStyle(
        fontSize: 12.sp,
        color: colors.text900,
        fontWeight: FontWeight.w600,
      ),
    );


    data = ThemeData( 
      fontFamily: 'Cabin',
      textTheme: textTheme,
      backgroundColor: colors.background,
      scaffoldBackgroundColor: colors.background,
      toggleableActiveColor: colors.primary,
      brightness: themeMode == ThemeMode.light
        ? Brightness.light
        : Brightness.dark,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.primary
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: colors.primary,
        selectedBorderColor: colors.primary,
        fillColor: colors.primary,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: colors.secondary,
        unselectedLabelColor: colors.primary,
        labelStyle: textTheme.subtitle1?.copyWith(
          color: colors.secondary,
        ),
        unselectedLabelStyle: textTheme.subtitle2,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: colors.primary,
        activeTickMarkColor: colors.primary,
        thumbColor: colors.primary,
        inactiveTrackColor: colors.primary.withOpacity(0.25)
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r)
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: colors.background,
        focusColor: colors.primary,
        filled: true,
        errorMaxLines: 3,
        floatingLabelStyle: textTheme.bodyText2?.copyWith(
          color: colors.primary
        ),
        labelStyle: textTheme.bodyText2?.copyWith(
          fontSize: 16.sp,
          color: colors.textSecondary
        ),
        counterStyle: textTheme.caption?.copyWith(
          color: colors.primary
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.stroke),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: colors.red),
        ),
        helperStyle: textTheme.bodyText2,
        hintStyle: textTheme.bodyText2?.copyWith(
          color: colors.textSecondary
        ),
        errorStyle: textTheme.caption?.copyWith(
          color: colors.red
        ),
        contentPadding:  EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 16.h,
        )
      )
    );
  }

  static BaseColors _getThemeColors() => const LightModeColors();
}
