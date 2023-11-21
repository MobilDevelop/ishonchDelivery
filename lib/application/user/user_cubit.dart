import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/user/user_state.dart';

class UserCubit extends Cubit<UserState>{
  UserCubit():super(UserInitial());
}