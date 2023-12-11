import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kuryer/application/drawer/drawer_cubit.dart';
import 'package:kuryer/application/drawer/drawer_state.dart';
import 'package:kuryer/infrastructure/helper/rive_utils.dart';
import 'package:kuryer/infrastructure/models/rive_models.dart';
import 'package:kuryer/presentattion/assets/asset_index.dart';
import 'package:kuryer/presentattion/pages/drawer/components/riv_widget.dart';
import 'package:kuryer/presentattion/routes/index_routes.dart';
import 'package:rive/rive.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key, required this.onpress});
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DrawerCubit(),
    child: BlocListener<DrawerCubit,DrawerState>(listener: (_, state) {
      if(state is DrawerLogOut){
          context.go(Routes.splash.path);
      }
    },
    child: Builder(builder: (context) {
      final cubit = context.read<DrawerCubit>();
      return BlocBuilder<DrawerCubit,DrawerState>(builder: (_, state) => Scaffold(
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
                  child: SvgPicture.asset(AppIcons.user,
                   height: ScreenSize.h32,
                  ),
                ),
               title: Text(cubit.userInfo?.fullname??"",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.white12)),
               subtitle: Text(cubit.userInfo?.phone??"",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               style: AppTheme.data.textTheme.bodySmall!.copyWith(color: AppTheme.colors.grey)), 
              ),
              Gap(ScreenSize.h32),
             ...sideMenus.map(
              (menu) => RivWidget(
                menu: menu, 
                press: (){
                  if(cubit.isPress){
                  cubit.isPress=false;
                  cubit.selectWindow(menu);
                  menu.input!.change(true);
                  Future.delayed(const Duration(seconds: 2),(){
                    cubit.isPress=true;
                     menu.input!.change(false);
                  });
                  onpress(menu.artboard);
                  }
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
              Bounce(
                duration: const Duration(milliseconds: 200),
                onPressed: (){
                 AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.bottomSlide,
            title: 'Rostdan ham',
            desc: 'chiqmoqchimisiz?',
            btnCancelText: "YO'Q",
            btnOkText: "HA",
            btnCancelOnPress: () {},
            btnOkOnPress:cubit.logOut,
            ).show();
                },
                child: Row(
                  children: [
                    Gap(ScreenSize.w32),
                    SvgPicture.asset(AppIcons.logout,color: AppTheme.colors.red,height: 30.h),
                    Gap(ScreenSize.w12),
                    Text(tr('drawer.exit'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.red),),
                  ],
                ),
              )
            ],
          ),
        ),
      ));
    },),
    ),
    );
  }
}