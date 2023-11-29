class SuccesItem{
  int pruductId;
  String dateTime;
  String latitude;
  String longtude;

  SuccesItem({required this.pruductId,required this.dateTime,required this.latitude,required this.longtude});

  Map<String,dynamic> toJson()=>{
    "output_product_id":pruductId,
    "delivery_at":dateTime,
    "latitude":latitude,
    "longtude":longtude
  };
}