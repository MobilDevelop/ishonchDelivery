 import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuryer/application/completed/completed_cubit.dart';
import 'package:kuryer/application/completed/completed_state.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';
import 'package:kuryer/presentattion/components/animation_loading/car_loading.dart';
import 'package:kuryer/presentattion/components/animation_loading/loading.dart';
import 'package:kuryer/presentattion/pages/completed/components/item_widget.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CompletedCubit(),
     child: BlocListener<CompletedCubit,CompletedState>(listener: (_, state) {
       
     },
      child: Builder(builder: (context) {
        final cubit = context.read<CompletedCubit>();
        return BlocBuilder<CompletedCubit,CompletedState>(builder: (_, state) => Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                        height: 80.h,
                        padding: EdgeInsets.only(bottom: ScreenSize.h10),
                        decoration: BoxDecoration(
                          color: AppTheme.colors.primary,
                        ),
                        alignment: Alignment.bottomCenter,
                        child: Text("Yakunlangan",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white))),
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
                      ], 
                      views: [
                        NotificationListener<ScrollNotification>(
                        onNotification: (notification){
                          if(notification.metrics.pixels==notification.metrics.maxScrollExtent){
                            if(!cubit.loading){
                              cubit.init();
                            }
                            return true;
                          }
                          return false;
                        },
                        child: RefreshIndicator(
                          onRefresh: cubit.listRefresh,
                          color: AppTheme.colors.primary,
                          child: ListView.builder(
                          itemCount: cubit.itemsCompleted.length+1,
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (_, index){
                            if(index<cubit.itemsCompleted.length){
                              return CompletedItem(item: cubit.itemsCompleted[index],type: 1);
                            }else{
                              return cubit.internetConnect?Visibility(
                                visible: !cubit.loading,
                                child: const Center(child: Loading()),
                              ):Container(
                                height: ScreenSize.h32,
                                width: double.maxFinite,
                                alignment: Alignment.center,
                                child: Text(tr('delivery.error'),style: AppTheme.data.textTheme.displayLarge),
                              );
                            }
                          }
                          ),
                        )),
                        NotificationListener<ScrollNotification>(
                        onNotification: (notification){
                          if(notification.metrics.pixels==notification.metrics.maxScrollExtent){
                            if(!cubit.loading){
                              cubit.init();
                            }
                            return true;
                          }
                          return false;
                        },
                        child: RefreshIndicator(
                          onRefresh: cubit.listRefresh,
                          color: AppTheme.colors.primary,
                          child: ListView.builder(
                          itemCount: cubit.itemsCanceled.length+1,
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (_, index){
                            if(index<cubit.itemsCanceled.length){
                              return CompletedItem(item: cubit.itemsCanceled[index],type:2);
                            }else{
                              return cubit.internetConnect?Visibility(
                                visible: !cubit.loading,
                                child: const Center(child: Loading()),
                              ):Container(
                                height: ScreenSize.h32,
                                width: double.maxFinite,
                                alignment: Alignment.center,
                                child: Text(tr('delivery.error'),style: AppTheme.data.textTheme.displayLarge),
                              );
                            }
                          }
                          ),
                        ))
                      ]))      
                ],
              ),
              Visibility(
                visible: cubit.loading,
                child: const CarLoading())
            ],
          )
        ));
      },),
     ),
    );
  }
}

