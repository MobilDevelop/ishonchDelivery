
List<Canceled> canceledFromMap(List list)=>List<Canceled>.from(list.map((json) => Canceled.fromJson(json)));

class Canceled{
  int productId;
  int cancelId;
  String comment;
  String? name;
  String? title;
  String? amount;
  String? cancelTitle;
  
  Canceled({required this.productId,required this.cancelId,required this.comment,this.name,this.amount,this.title,this.cancelTitle});

  factory Canceled.fromJson(Map<String,dynamic> json)=>Canceled(
    productId: json['output_product_id'], 
    cancelId: json['delivery_cancel_reason_id'], 
    comment: json['comment'],
    name: json['name'],
    title: json['title'],
    amount: json['amount'],
    cancelTitle: json['cTitle']);

  Map<String,dynamic> sendToJson()=>{
    'output_product_id':productId,
    'delivery_cancel_reason_id':cancelId,
    "comment":comment
  };

   Map<String,dynamic> saveToJson()=>{
    'output_product_id':productId,
    'delivery_cancel_reason_id':cancelId,
    "comment":comment,
    'name':name,
    'title':title,
    'amount':amount,
    'cTitle':cancelTitle
  };
}