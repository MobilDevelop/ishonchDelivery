import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:kuryer/application/splash/splash_cubit.dart';
import 'package:kuryer/application/splash/splash_state.dart';
import 'package:kuryer/presentattion/assets/asset_index.dart';
import 'package:kuryer/presentattion/components/animation_loading/loading.dart';
import 'package:kuryer/presentattion/components/button/border_button.dart';
import 'package:kuryer/presentattion/routes/index_routes.dart';
import 'components/animation_screen.dart';
import 'components/item_widget_cancel.dart';
import 'components/item_widget_succes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SplashCubit(),
     child: BlocListener<SplashCubit,SplashState>(listener: (_, state) {
       if(state is SplashNextHome){
        context.go(Routes.home.path);
       }else if(state is SplashNextLogin){
        context.go(Routes.login.path);
       }else if(state is SplashError){
         ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppTheme.colors.primary,
              content: Text(
                state.message,
                textAlign: TextAlign.center,
                style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.white)
              ),
            ),
          );
       }
     },
     child: Builder(builder: (context) {
       final cubit = context.read<SplashCubit>();
       return BlocBuilder<SplashCubit,SplashState>(builder: (_, state) => Stack(
         children: [
           Scaffold(
            backgroundColor: AppTheme.colors.background, 
            body: cubit.resendInfo?
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Container(
                      height: 85.h,
                      width: double.maxFinite,
                      color: AppTheme.colors.primary,
                      padding: EdgeInsets.only(bottom: ScreenSize.h12),
                      alignment: Alignment.bottomCenter,
                      child: Text(tr('splash.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.background)),
                    ),
                    Expanded(
                      child: ContainedTabBarView(
                        tabBarProperties: TabBarProperties(
                          indicatorColor: AppTheme.colors.primary,
                          unselectedLabelColor: AppTheme.colors.grey,
                          labelColor: AppTheme.colors.primary
                        ),
                        tabs: const [
                        Text("Tasdiqlangan"),
                        Text("Bekor qilingan")
                      ], views: [
                        cubit.succesItem.isEmpty?Center(
                          child: Text("Tasdiqlanganlar mavjud emas",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.primary)),
                        ):ListView.builder(
                        itemCount: cubit.succesItem.length,
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (_, index) => ItemWidgetSucces(item:cubit.succesItem[index])),
                        cubit.canceledItems.isEmpty?Center(
                          child: Text("Bekor qilinganlar mavjud emas",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.primary)),
                        ):ListView.builder(
                        itemCount: cubit.canceledItems.length,
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (_, index) => ItemWidgetCanceled(item:cubit.canceledItems[index])),
                      ])
                    ),
                     Container(
              height: 45.h,
              margin: EdgeInsets.only(bottom: ScreenSize.h20,left: ScreenSize.w14,right: ScreenSize.w14),
                child: 
                Row(
                  children: [
                    Expanded(
                      child: BorderButton(
                        onPressed: cubit.cancel,
                      borderColor: AppTheme.colors.red,
                        text: tr('splash.cancel'),
                      ),
                    ),
                    Gap(ScreenSize.h12),
                    Expanded(
                      child: BorderButton(
                        onPressed: cubit.uploadItems,
                        text: tr('splash.upload'),
                      ),
                    ),
                  ],
                ),
              ),     
                  ],
                ),
             Visibility(
              visible: cubit.loading,
              child: const Loading())
              ],
            ):
            Center(child: Text("ISHONCH DELIVERY",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary))),
           ),
           IgnorePointer(
            child: AnimationScreen(
              color: AppTheme.colors.primary
            )
          )
         ],
       ));
     },),
     ),
    );
  }
}

