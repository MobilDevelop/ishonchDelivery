import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuryer/application/home/home_cubit.dart';
import 'package:kuryer/application/home/home_state.dart';
import 'package:kuryer/infrastructure/helper/rive_utils.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';
import 'package:kuryer/presentattion/pages/drawer/drawer_page.dart';
import 'package:rive/rive.dart';

import 'components/leading_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
    late Animation<double> animation;
    late Animation<double> scalAnimation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 200))..addListener(() {
       setState(() {});
     });
     animation = Tween<double>(begin: 0,end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn)
     );
     scalAnimation = Tween<double>(begin: 1,end: 0.8).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn)
     );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose(); 
     super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HomeCubit(),
     child: BlocListener<HomeCubit,HomeState>(listener: (_, state) {
        if(state is HomeNextWiew){
          _animationController.reverse();
        }
     },
     child: Builder(builder: (context) {
       final cubit = context.read<HomeCubit>();

       return BlocBuilder<HomeCubit,HomeState>(builder: (_, state) => Scaffold(
         backgroundColor: AppTheme.colors.stroke,
         body: Stack(
           children: [
             AnimatedPositioned(
              duration: const Duration(milliseconds: 200),  
              curve: Curves.fastOutSlowIn,
              width: 260.w,
              left: cubit.isSideMenuclosed? -260.w:0, 
              height: double.maxFinite,
              child:  DrawerPage(onpress: (String title)=>cubit.nextPage(title))),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(animation.value-30*animation.value*pi/180),
                child: Transform.translate(
                  offset:Offset(animation.value*210 .w, 0), 
                  child: Transform.scale(
                    scale: scalAnimation.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),
                      child: cubit.views[cubit.currentPage])),
                  ),
              ),
             AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              top: 10.h,
              left: cubit.isSideMenuclosed?0:170.w,
               child: LeadingButton(press: (){
                if(cubit.isSideMenuclosed){
                  _animationController.forward();
                }else{
                  _animationController.reverse();
                }
                cubit.isOpen();
               }, riveOnInit: (artboard) { 
                 StateMachineController controller = RiveUtils.getRiveController(
                  artboard,
                  stateMachinaName: "State Machine");
                 cubit.isMenuOpen = controller.findSMI("isOpen")as SMIBool;
                 cubit.isMenuOpen.value=true;
                }),
             )
           ],
         ),
        
       ));
     },),
     ),
    );
  }
}