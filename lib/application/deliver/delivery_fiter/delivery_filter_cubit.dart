import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/deliver/delivery_fiter/delivery_filter_state.dart';
import 'package:kuryer/domain/provider/delivery_services.dart';
import 'package:kuryer/infrastructure/models/delivery_order/delivery_filter.dart';

class DeliveryFilterCubit extends Cubit<DeliverFilterState>{
  DeliveryFilterCubit():super(DeliveryFilterInitial());
  
    List<DeliveryFilterItem> villages =[];
    DeliveryFilterItem? selectVillage;
    DeliveryFilterItem? selectRegions;
  

  void selectRegion(DeliveryFilterItem item)async{
    selectRegions=item;
    selectVillage=null;
    villages.clear();
    villages = await DeliveryService().villages(item.id.toString());
    emit(DeliveryFilterInitial());
  }

  void villageSelect(DeliveryFilterItem item){
    selectVillage=item;
    emit(DeliveryFilterInitial());
  }
}