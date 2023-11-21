import 'package:bloc/bloc.dart';
import 'package:kuryer/presentattion/assets/asset_index.dart';
part 'app_manager_state.dart';

class AppManagerCubit extends Cubit<AppManagerState> {
  AppManagerCubit() : super(AppManagerLoading());   
  
  dynamic subscription;

  Future<void> init() async {

    
    try {
      await AppTheme.init();
      await ScreenSize.setSizes();
      emit(AppManagerInitial());
    } catch (e) {
      emit(AppManagerError(e.toString()));
    }
  }


}
