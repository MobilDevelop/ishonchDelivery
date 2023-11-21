import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/deliver/deliver_state.dart';

class DeliverCubit extends Cubit<DeliverState>{
  DeliverCubit():super(DeliverInitial());
}