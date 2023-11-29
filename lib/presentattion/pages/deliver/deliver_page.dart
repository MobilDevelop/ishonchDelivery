import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/deliver/deliver_cubit.dart';
import 'package:kuryer/application/deliver/deliver_state.dart';
import 'package:kuryer/presentattion/assets/asset_index.dart';
import 'package:kuryer/presentattion/components/animation_loading/car_loading.dart';
import 'package:kuryer/presentattion/components/animation_loading/loading.dart';
import 'components/delivery_bottom_sheet.dart';
import 'components/delivery_item.dart';

class DeliverPage extends StatelessWidget {
  const DeliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DeliverCubit(),
     child: BlocListener<DeliverCubit,DeliverState>(listener: (_, state) {
       
     },
      child: Builder(builder: (context) {
        final cubit  = context.read<DeliverCubit>();
        return BlocBuilder<DeliverCubit,DeliverState>(builder: (context, state) => Scaffold(
          backgroundColor: AppTheme.colors.background,
          body: Stack(
            children: [
              SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Container(
                        height: 80.h,
                        padding: EdgeInsets.only(bottom: ScreenSize.h10),
                        decoration: BoxDecoration(
                          color: AppTheme.colors.primary,
                        ),
                        alignment: Alignment.bottomCenter,
                        child: Text(tr('delivery.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white))),
                    Expanded(
                      child: NotificationListener<ScrollNotification>(
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
                          itemCount: cubit.items.length+1,
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (_, index){
                            if(index<cubit.items.length){
                              return DeliveryItem(
                             item: cubit.items[index],
                            press:()=>cubit.onVisibleItem(cubit.items[index].id), 
                            buttonVisible: cubit.items[index].id==cubit.itemId, 
                            pressAccept: () { 
                          AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.success,
                                    animType: AnimType.bottomSlide,
                                    title: 'Tasdiqlamoqchimisiz?',
                                    btnCancelText: "YO'Q",
                                    btnOkText: "HA",
                                    btnCancelOnPress: () {},
                                    btnOkOnPress:()=>cubit.onAccept(cubit.items[index].id),
                                    ).show();
                             }, 
                            pressCancel: () { 
                               showModalBottomSheet(
                                context: context, 
                                backgroundColor: Colors.transparent,
                                builder: (context) => DeliveryBottomSheet(
                                  press:cubit.onCancel
                                  ));
                             });
                            }else{
                              return cubit.internetConnect?Visibility(
                                visible: !cubit.loading,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: ScreenSize.h32),
                                  child: const Center(child: Loading()),
                                ),
                              ):Container(
                                height: ScreenSize.h32,
                                width: double.maxFinite,
                                alignment: Alignment.center,
                                child: Text(tr('delivery.error'),style: AppTheme.data.textTheme.displayLarge),
                              );
                            }
                          }
                          ),
                        )))
                  ]
                ),
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