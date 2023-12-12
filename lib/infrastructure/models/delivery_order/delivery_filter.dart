List<DeliveryFilterItem> deliveryFilterRegionsFromMap(List list)=>List<DeliveryFilterItem>.from(list.map((json) => DeliveryFilterItem.fromJsonRegions(json)));

List<DeliveryFilterItem> deliveryFilterVillageFromMap(List list)=>List<DeliveryFilterItem>.from(list.map((json) => DeliveryFilterItem.fromJsonVillage(json)));

class DeliveryFilterItem{
  int id;
  String title;

  DeliveryFilterItem({required this.id,required this.title});

  factory DeliveryFilterItem.fromJsonRegions(Map<String,dynamic> json)=>DeliveryFilterItem(
    id: json['id'], 
    title: json['region_name_latin']);

    factory DeliveryFilterItem.fromJsonVillage(Map<String,dynamic> json)=>DeliveryFilterItem(
    id: json['id'], 
    title: json['village_name_latin']);
  }