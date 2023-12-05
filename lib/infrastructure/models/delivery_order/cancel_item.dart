
List<CancelItem> cancelItemFromMap(List list)=>List<CancelItem>.from(list.map((json) => CancelItem.fromJson(json)));

class CancelItem{
  int id;
  String title;

  CancelItem({required this.id,required this.title});

  factory CancelItem.fromJson(Map<String,dynamic> json)=>CancelItem(
    id: json['id'], 
    title: json['title']);

    Map<String,dynamic> toJson()=>{
      'id':id,
      'title':title
    };
  }