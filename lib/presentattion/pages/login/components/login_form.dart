import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kuryer/domain/common/constants.dart';
import 'package:kuryer/presentattion/assets/res/app_icons.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.press, required this.loginController, required this.passwordController});
  final VoidCallback press;
  final TextEditingController loginController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin:  EdgeInsets.only(bottom: 40.h),
          child:  Text(tr('login_page.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary),
          ),
        ),
        Stack(
          children: [
            Container(
              height: 150.h,
              width: double.maxFinite,
              margin:  EdgeInsets.only(
                right: 50.w,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:  BorderRadius.only(
                  topRight: Radius.circular(100.r),
                  bottomRight: Radius.circular(100.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 45.h,
                    width: double.maxFinite,
                    margin:  EdgeInsets.only(left: 5.w, right: 40.w),
                    padding: EdgeInsets.only(left: ScreenSize.w6,right: ScreenSize.w10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppTheme.colors.primary
                      ),
                      borderRadius: BorderRadius.circular(15.r)
                    ),
                    child:  TextField(
                      controller: loginController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        hintStyle: AppTheme.data.textTheme.displaySmall!.copyWith(color: AppTheme.colors.grey),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        icon: SvgPicture.asset(AppIcons.login,height: 28.h),
                        hintText: tr('login_page.login'),
                      ),
                    ),
                  ),
                  Container(
                    height: 45.h,
                    width: double.maxFinite,
                    margin:  EdgeInsets.only(left: 5.w, right: 40.w),
                    padding: EdgeInsets.only(left: ScreenSize.w6,right: ScreenSize.w10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppTheme.colors.primary
                      ),
                      borderRadius: BorderRadius.circular(15.r)
                    ),
                    child:  TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        hintStyle: AppTheme.data.textTheme.displaySmall!.copyWith(color: AppTheme.colors.grey),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        icon: SvgPicture.asset(AppIcons.password,height: 28.h),
                        hintText: tr('login_page.pass'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Bounce(
              duration: Duration(milliseconds: AppContatants.duration),
              onPressed: press,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin:  EdgeInsets.only(right: 8.w,top: 38.h),
                  height: 65.h,
                  width: 65.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.colors.grey.withOpacity(0.8),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:  Offset(4.w, 6.h),
                      ),
                    ],
                    shape: BoxShape.circle,
                    gradient:  LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                       AppTheme.colors.primary,
                       AppTheme.colors.primary.withOpacity(.5),
                      ],
                    ),
                  ),
                  child:  Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.white,
                    size: 32.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}