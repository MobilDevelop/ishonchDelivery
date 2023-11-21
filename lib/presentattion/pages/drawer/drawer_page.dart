import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:kuryer/application/drawer/drawer_cubit.dart';
import 'package:kuryer/application/drawer/drawer_state.dart';
import 'package:kuryer/infrastructure/helper/rive_utils.dart';
import 'package:kuryer/infrastructure/models/rive_models.dart';
import 'package:kuryer/presentattion/assets/asset_index.dart';
import 'package:kuryer/presentattion/pages/drawer/components/riv_widget.dart';
import 'package:rive/rive.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key, required this.onpress});
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DrawerCubit(),
    child: BlocListener<DrawerCubit,DrawerState>(listener: (context, state) {
      
    },
    child: Builder(builder: (context) {
      final cubit = context.read<DrawerCubit>();
      return BlocBuilder<DrawerCubit,DrawerState>(builder: (context, state) => Scaffold(
        body:  Container(
          height: double.maxFinite,
          width: 230.w,
          padding: EdgeInsets.only(top: 50.h),
          child: Column(
            children: [
              Gap(50.h),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppTheme.colors.background,
                  radius: 35,
                ),
               title: Text("Ayubxon",style: AppTheme.data.textTheme.displayLarge!.copyWith(color: AppTheme.colors.white12)),
               subtitle: Text("salom",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.white12)), 
              ),
              Gap(ScreenSize.h32),
             ...sideMenus.map(
              (menu) => RivWidget(
                menu: menu, 
                press: (){
                  cubit.selectWindow(menu);
                  menu.input!.change(true);
                  Future.delayed(const Duration(seconds: 1),(){
                     menu.input!.change(false);
                  });
                  onpress(menu.title);
                }, 
                riveonInit: (artboard){
                 StateMachineController controller = RiveUtils.getRiveController(artboard,stateMachinaName: menu.stateMachineName);
                 menu.input = controller.findSMI("active") as SMIBool;
                }, 
                isActive: cubit.selectedMenu==menu)
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Divider(
                  color: AppTheme.colors.background,
                  height: 1,
                ),
              ),
              Gap(300.h),
              Text("CHIQISH",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.red),)
            ],
          ),
        ),
      ));
    },),
    ),
    );
  }
}

