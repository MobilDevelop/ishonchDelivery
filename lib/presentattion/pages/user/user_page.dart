import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kuryer/application/user/user_cubit.dart';
import 'package:kuryer/application/user/user_state.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';

import 'components/user_image_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => UserCubit(),
     child: BlocListener<UserCubit,UserState>(listener: (context, state) {
       
     },
     child: Builder(builder: (context) {
        final cubit = context.read<UserCubit>();
        return BlocBuilder<UserCubit,UserState>(builder: (context, state) => Scaffold(
          body: Column(
            children: [
              Container(
                    height: 80.h,
                    padding: EdgeInsets.only(bottom: ScreenSize.h10),
                    decoration: BoxDecoration(
                      color: AppTheme.colors.primary,
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Text(tr('user_page.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white))),
                    Expanded(
                      child: cubit.userInfo==null?Container():Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(ScreenSize.h12),
                        const UserIconWidget(),
                        Text(cubit.userInfo!.fullname,style: AppTheme.data.textTheme.headlineMedium!.copyWith(color: AppTheme.colors.primary)),
                        Gap(ScreenSize.h4),
                        Text("Id: ${cubit.userInfo!.id}",style: AppTheme.data.textTheme.displayMedium),
                        Gap(ScreenSize.h20),
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.only(left: ScreenSize.w16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tr('user_page.carnumber'),style: AppTheme.data.textTheme.displayMedium),
                              Gap(ScreenSize.h4),
                              Text(cubit.userInfo!.carnumber,style: AppTheme.data.textTheme.headlineMedium!.copyWith(color: AppTheme.colors.primary)),
                            ],
                          ),
                        ),
                        Gap(ScreenSize.h10),
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.only(left: ScreenSize.w16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tr('user_page.phone'),style: AppTheme.data.textTheme.displayMedium),
                              Gap(ScreenSize.h4),
                              Text(cubit.userInfo!.phone,style: AppTheme.data.textTheme.headlineMedium!.copyWith(color: AppTheme.colors.primary)),
                            ],
                          ),
                        )

                      ],
                    ))
            ],
          )
        ));
     },),
     ),
    );
  }
}

