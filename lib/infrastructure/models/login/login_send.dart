class LoginSend{
  String login;
  String password;

  LoginSend({required this.login,required this.password});

  Map<String, dynamic> toJson()=>{
    "username":login,
    "password":password
  };
}