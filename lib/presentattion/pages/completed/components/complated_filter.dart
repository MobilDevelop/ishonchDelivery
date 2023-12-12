import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:kuryer/application/completed/completed_filter/completed_filter_cubit.dart';
import 'package:kuryer/application/completed/completed_filter/completed_filter_state.dart';
import 'package:kuryer/infrastructure/models/delivery_order/delivery_filter.dart';
import 'package:kuryer/presentattion/assets/asset_index.dart';
import 'package:kuryer/presentattion/components/button/border_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class CompletedFilter extends StatelessWidget {
  const CompletedFilter({
    super.key,  required this.press,required this.dateRangePickerController, required this.regions, 
  });

  final List<DeliveryFilterItem> regions;
  final Function press;
  final DateRangePickerController dateRangePickerController;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CompletedFilterCubit(),
    child: Builder(builder: (context) {
      final cubit = context.read<CompletedFilterCubit>();
      return BlocBuilder<CompletedFilterCubit,CompletedFilterState>(builder: (context, state) => Container(
      padding: EdgeInsets.symmetric( horizontal: ScreenSize.w10),
      height: 420.h,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r) ),
        color: AppTheme.colors. white,
      ),
      child: Column(
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
              hintText: tr('completed.region'),
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
              selectedItem: cubit.selectRegion,
              itemAsString: (DeliveryFilterItem? item) {
              return item!.title.toString();},
              onChanged: (item)=>cubit.regionSelect(item!)
            ),
            Gap(ScreenSize.h24),
            DropdownSearch<DeliveryFilterItem>(
              mode: Mode.MENU,
              items: cubit.villages,
              dropdownSearchDecoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal:0),
              hintText: tr('completed.district'),
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
            Gap(ScreenSize.h20),
            Container(
              height: 200.h,
              child: SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.range,
                maxDate: DateTime.now(),
                controller: dateRangePickerController,
                       ),
            ),
              ],
            ),
            Padding(
           padding:  EdgeInsets.only(bottom: ScreenSize.h24),
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
                    "region_id":cubit.selectRegion?.id??"",
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