import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:kuryer/application/deliver/delivery_fiter/delivery_filter_cubit.dart';
import 'package:kuryer/application/deliver/delivery_fiter/delivery_filter_state.dart';
import 'package:kuryer/infrastructure/models/delivery_order/delivery_filter.dart';
import 'package:kuryer/presentattion/assets/asset_index.dart';
import 'package:kuryer/presentattion/components/button/border_button.dart';

class DeliveryFilter extends StatelessWidget {
  const DeliveryFilter({
    super.key, required this.regions, required this.press
  });

  final List<DeliveryFilterItem> regions;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DeliveryFilterCubit(),
    child: Builder(builder: (context) {
      final cubit = context.read<DeliveryFilterCubit>();
      return BlocBuilder<DeliveryFilterCubit,DeliverFilterState>(builder: (context, state) => Container(
      padding: EdgeInsets.symmetric( horizontal: ScreenSize.w10),
      height: 700.h,
      decoration:  BoxDecoration( 
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r) ),
        color: AppTheme.colors. white,
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Column(
            children: [
               Gap(ScreenSize.h10),
          Container(
            height: ScreenSize.h4,
            width: 130.w,
            decoration: BoxDecoration(
              color: AppTheme.colors.black,
              borderRadius: BorderRadius.circular(4.r)
            ),
          ),
          Gap(ScreenSize.h20),
            DropdownSearch<DeliveryFilterItem>(
              mode: Mode.MENU,
              items: regions,
              dropdownSearchDecoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal:0),
              hintText: tr('delivery.region'),
              prefixIcon: Visibility(
              visible: false,
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.close,color: Colors.black))),
              enabledBorder: OutlineInputBorder(
              borderRadius:BorderRadius.circular(10.r),
              borderSide: BorderSide(
              color: AppTheme.colors.primary)),
              focusedBorder: OutlineInputBorder(
              borderRadius:BorderRadius.circular(10.r),
              borderSide: BorderSide(
              color: AppTheme.colors.primary))),
              selectedItem: cubit.selectRegions,
              itemAsString: (DeliveryFilterItem? item) {
              return item!.title.toString();},
              onChanged: (item)=>cubit.selectRegion(item!)
            ),
            Gap(ScreenSize.h24),
            DropdownSearch<DeliveryFilterItem>(
              mode: Mode.MENU,
              items: cubit.villages,
              dropdownSearchDecoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal:0),
              hintText: tr('delivery.district'),
              prefixIcon: Visibility(
              visible: false,
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.close,color: Colors.black))),
              enabledBorder: OutlineInputBorder(
              borderRadius:BorderRadius.circular(10.r),
              borderSide: BorderSide(
              color: AppTheme.colors.primary)),
              focusedBorder: OutlineInputBorder(
              borderRadius:BorderRadius.circular(10.r),
              borderSide: BorderSide(
              color: AppTheme.colors.primary))),
              selectedItem: cubit.selectVillage,
              itemAsString: (DeliveryFilterItem? item) {
              return item!.title.toString();},
              onChanged: (item)=>cubit.villageSelect(item!)
            ),
            ],
           ),
           Padding(
             padding:  EdgeInsets.only(left: ScreenSize.w10,right: ScreenSize.w10,bottom: ScreenSize.h24),
             child: Row(
              children: [
                Expanded(child: BorderButton(onPressed: (){
                  Navigator.pop(context);
                }, text: tr('delivery.cancel'),borderColor: AppTheme.colors.red)),
                Gap(ScreenSize.w10),
                Expanded(child: BorderButton(onPressed: (){
                  Navigator.pop(context);
                  press(
                    {
                      "village_id":cubit.selectVillage?.id??"",
                      "region_id":cubit.selectRegions?.id??"",
                    }
                  );
                }, text: tr('delivery.accept'))),
              ],
             ),
           )
          ]
        )
    ));
    },),
    );
  }
}