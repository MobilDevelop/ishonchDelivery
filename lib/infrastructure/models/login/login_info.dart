class UserInfo {
  int id;
  int carId;
  String fullname;
  String username;
  String phone;
  int organizationId;
  bool active;
  String additionalnformation;
  String carnumber;

  UserInfo({
    required this.id,
    required this.carId,
    required this.organizationId,
    required this.fullname,
    required this.username,
    required this.phone,
    required this.active,
    required this.additionalnformation,
    required this.carnumber
    });

    factory UserInfo.fromJson(Map<String,dynamic> json)=>UserInfo(
      id: json['id'], 
      carId: json['driver']['id'], 
      organizationId: json['organization_id'], 
      fullname: json['fullname'], 
      username: json['username'], 
      phone: json['phone'], 
      active: json['active'], 
      additionalnformation: json['driver']['additional_information'], 
      carnumber: json['driver']['plate_number']);

      
}