import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/completed/completed_filter/completed_filter_state.dart';
import 'package:kuryer/domain/provider/delivery_services.dart';
import 'package:kuryer/infrastructure/models/delivery_order/delivery_filter.dart';

class CompletedFilterCubit extends Cubit<CompletedFilterState>{
  CompletedFilterCubit():super(CompletedFilterInitial());

  List<DeliveryFilterItem> villages = [];
  DeliveryFilterItem? selectVillage;
  DeliveryFilterItem? selectRegion;


  void regionSelect(DeliveryFilterItem item)async{
    selectRegion=item;
    selectVillage=null;
    villages.clear();
    villages = await DeliveryService().villages(item.id.toString());
    emit(CompletedFilterInitial());
  }

  void villageSelect(DeliveryFilterItem item){
    selectVillage=item;
    emit(CompletedFilterInitial());
  }
}