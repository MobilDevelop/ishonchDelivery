import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/completed/completed_state.dart';

class CompletedCubit extends Cubit<CompletedState>{
  CompletedCubit():super(CompletedInitial());
}