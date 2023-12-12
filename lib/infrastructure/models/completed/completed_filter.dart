List<CompletedFilter> completedFilterFromMap(List list)=>List<CompletedFilter>.from(list.map((json) => CompletedFilter.fromJson(json)));

class CompletedFilter{
  int id;
  String title;

  CompletedFilter({required this.id,required this.title});

  factory CompletedFilter.fromJson(Map<String,dynamic> json)=>CompletedFilter(
    id: json['id'], 
    title: json['title']);

  }