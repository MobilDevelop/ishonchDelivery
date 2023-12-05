abstract class SplashState {}

class SplashInitial extends SplashState{}

class SplashNextHome extends SplashState{}

class SplashNextLogin extends SplashState{}

class SplashError extends SplashState{
  final String message;
  SplashError({required this.message});
}