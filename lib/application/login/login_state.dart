abstract class LoginState {}

class LoginInitial extends LoginState{}

class LoginNextHome extends LoginState{}

class LoginError extends LoginState{
  String msg;
  LoginError({required this.msg});
}