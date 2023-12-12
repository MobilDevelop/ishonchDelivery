import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kuryer/application/deliver/deliver_cubit.dart';
import 'package:kuryer/application/deliver/deliver_state.dart';
import 'package:kuryer/presentattion/assets/asset_index.dart';
import 'package:kuryer/presentattion/components/animation_loading/car_loading.dart';
import 'package:kuryer/presentattion/components/animation_loading/loading.dart';
import 'package:kuryer/presentattion/pages/deliver/components/delivery_filter.dart';
import 'package:kuryer/presentattion/routes/index_routes.dart';
import 'components/delivery_bottom_sheet.dart';
import 'components/delivery_item.dart';

class DeliverPage extends StatelessWidget {
  const DeliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DeliverCubit(),
     child: BlocListener<DeliverCubit,DeliverState>(listener: (_, state) {
       if(state is DeliverNextSplash){
        context.go(Routes.splash.path);
       }else if(state is DeliveryMessage){
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
        final cubit  = context.read<DeliverCubit>();
        return BlocBuilder<DeliverCubit,DeliverState>(builder: (context, state) => Scaffold(
          backgroundColor: AppTheme.colors.background,
          appBar: AppBar(
            backgroundColor: AppTheme.colors.primary,
            elevation: 0,
            title:  Text(tr('delivery.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
            actions: [
              Visibility(
                visible:  cubit.internetConnect,
                child: IconButton(
                                onPressed: () {
                                  if(!cubit.loading){
                                    showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context, builder: (context) => DeliveryFilter(
                                      press:cubit.filterActive,
                                    regions:cubit.regions, 
                                   )
                                  );
                                  }
                                 },
                                icon: SvgPicture.asset(AppIcons.filter, height: ScreenSize.h24,color: AppTheme.colors.white),
                              ),
              ),
            ],
          ),
          body: Stack(
            children: [
              NotificationListener<ScrollNotification>(
                onNotification: (notification){
                  if(notification.metrics.pixels==notification.metrics.maxScrollExtent){
                    if(!cubit.loading){
                      cubit.init({});
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
                    press:(){
                      if(!cubit.loading){
                        cubit.onVisibleItem(cubit.items[index].id);
                      }
                    }, 
                    buttonVisible: cubit.items[index].id==cubit.itemId, 
                    pressAccept: () { 
                      if(!cubit.loading){
                         AwesomeDialog(
                            context: context,
                            dialogType: DialogType.success,
                            animType: AnimType.bottomSlide,
                            title: 'Tasdiqlamoqchimisiz?',
                            btnCancelText: "YO'Q",
                            btnOkText: "HA",
                            btnCancelOnPress: () {},
                            btnOkOnPress:()=>cubit.onAccept(cubit.items[index]),
                            ).show();
                      }
                     }, 
                    pressCancel: () { 
                     if(!cubit.loading){
                        cubit.cancelItem=null;
                        showModalBottomSheet(
                        context: context, 
                        backgroundColor: Colors.transparent,
                        builder: (context) => DeliveryBottomSheet(
                          press:()=>cubit.onCancel(cubit.items[index]), 
                          item: cubit.cancelItem, 
                          items: cubit.cancelItems, 
                          onChanged:(canceled)=>cubit.onselectCancel(canceled), 
                          controller: cubit.cancelCommit,
                          )
                          );
                     }
                     }
                     );
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
                )),
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

