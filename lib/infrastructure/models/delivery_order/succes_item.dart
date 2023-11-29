
List<SuccesItem> saveItemFromMap(List list)=>List<SuccesItem>.from(list.map((json) => SuccesItem.fromJson(json)));

class SuccesItem{
  int pruductId;
  String? name;
  String? title;
  String? amount;
  String dateTime;
  String latitude;
  String longtude;

  SuccesItem({required this.pruductId,required this.dateTime,required this.latitude,required this.longtude,this.name,this.title,this.amount});

  factory SuccesItem.fromJson(Map<String,dynamic> json)=>SuccesItem(
    pruductId: json['id'], 
    dateTime: json['datetime'], 
    latitude: json['latitude'], 
    longtude: json['longtude'],
    name: json['name'],
    title: json['title'],
    amount: json['amount']
    );
  
  Map<String,dynamic> sendToJson()=>{
    "output_product_id":pruductId,
    "delivery_at":dateTime,
    "latitude":latitude,
    "longtude":longtude
  };

  Map<String,dynamic> saveToJson()=>{
    "id":pruductId,
    "datetime":dateTime,
    "latitude":latitude,
    "longtude":longtude,
    "name":name,
    "title":title,
    "amount":amount
  };
}