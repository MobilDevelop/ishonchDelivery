import 'package:kuryer/infrastructure/models/delivery_order/order_item.dart';
List<CompltedItem> completedItemFromMap(List list)=>List<CompltedItem>.from(list.map((json) => CompltedItem.fromJson(json)));

List<CompltedItem> completedItemMemoryFromMap(List list)=>List<CompltedItem>.from(list.map((json) => CompltedItem.fromJsonMemory(json)));

class CompltedItem extends OrderItem{
  String deliveryDateTime;
  String? cancelReason;
  String camcelComment;

  CompltedItem({
    required super.id, 
    required super.amount, 
    required super.address, 
    required super.orientation, 
    required super.phone, 
    required super.addtionalPhone, 
    required super.name, 
    required super.comment, 
    required super.productTitle,
    required this.deliveryDateTime,
    required this.camcelComment,
    this.cancelReason});
    
      factory CompltedItem.fromJson(Map<String,dynamic> json)=>CompltedItem(
    id: json['id']??-1, 
    amount: json['product_delivery']['amount']??"", 
    address: json['product_delivery']['address']??"",
    orientation: json['product_delivery']['orientation']??"", 
    phone: json['product_delivery']['main_phone_number']??"",
    addtionalPhone: json['product_delivery']['additional_phone_number']??"", 
    name: json['product_delivery']['receiver_full_name']??"", 
    comment: json['product_delivery']['comment']??"", 
    productTitle: json['product_variant']['product_variant_title']??"",
    camcelComment: json['comment'],
    deliveryDateTime: json['delivery']==null?"":json['delivery']['delivery_at']??"",
    cancelReason: json['delivery_cancel_reason']==null?"":json['delivery_cancel_reason']['title']);

    factory CompltedItem.fromJsonMemory(Map<String,dynamic> json)=>CompltedItem(
    id: json['id']??-1, 
    amount: json['amount']??"", 
    address: json['address']??"",
    orientation: json['orientation']??"", 
    phone: json['phone']??"",
    addtionalPhone: json['additionalPhone']??"", 
    name: json['name']??"", 
    comment: json['comment']??"", 
    productTitle: json['productTitle']??"",
    deliveryDateTime: json['deliveryDate']??"",
    camcelComment: json['cancelComment'],
    cancelReason: json['reason']);

    Map<String,dynamic> toJson()=>{
      "id":id,
      "amount":amount,
      "address":address,
      "orientation":orientation,
      "phone":phone,
      "additionalPhone":addtionalPhone,
      "name":name,
      "comment":comment,
      "productTitle":productTitle,
      "deliveryDate":deliveryDateTime,
      'cancelComment':camcelComment,
      'reason':cancelReason
    };
}