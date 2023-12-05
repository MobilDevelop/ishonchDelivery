List<OrderItem> orderItemFromMap(List list)=>List<OrderItem>.from(list.map((json) => OrderItem.fromJson(json)));

List<OrderItem> orderItemMemoryFromMap(List list)=>List<OrderItem>.from(list.map((json) => OrderItem.fromJsonMemory(json)));

class OrderItem{
 int id;
 String amount;
 String address;
 String orientation;
 String phone;
 String addtionalPhone;
 String name;
 String comment;
 String productTitle;
 String? saveMemory;
 
  OrderItem({
    required this.id,
    required this.amount,
    required this.address,
    required this.orientation,
    required this.phone,
    required this.addtionalPhone,
    required this.name,
    required this.comment,
    required this.productTitle,
    this.saveMemory
  });

  factory OrderItem.fromJson(Map<String,dynamic> json)=>OrderItem(
    id: json['id']??-1, 
    amount: json['product_delivery']['amount']??"", 
    address: json['product_delivery']['address']??"",
    orientation: json['product_delivery']['orientation']??"", 
    phone: json['product_delivery']['main_phone_number']??"",
    addtionalPhone: json['product_delivery']['additional_phone_number']??"", 
    name: json['product_delivery']['receiver_full_name']??"", 
    comment: json['product_delivery']['comment']??"", 
    productTitle: json['product_variant']['product_variant_title']??"");

    factory OrderItem.fromJsonMemory(Map<String,dynamic> json)=>OrderItem(
    id: json['id']??-1, 
    amount: json['amount']??"", 
    address: json['address']??"",
    orientation: json['orientation']??"", 
    phone: json['phone']??"",
    addtionalPhone: json['additionalPhone']??"", 
    name: json['name']??"", 
    comment: json['comment']??"", 
    productTitle: json['productTitle']??"",
    saveMemory: json['save']);


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
      "save":saveMemory
    };
}