import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/splash/splash_cubit.dart';
import 'package:kuryer/application/splash/splash_state.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';
import 'package:kuryer/presentattion/routes/index_routes.dart';

import 'animation_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SplashCubit(),
     child: BlocListener<SplashCubit,SplashState>(listener: (_, state) {
       if(state is SplashNextHome){
        context.go(Routes.login .path);
       }
     },
     child: Builder(builder: (context) {
       final cubit = context.read<SplashCubit>();
       return BlocBuilder<SplashCubit,SplashState>(builder: (_, state) => Stack(
         children: [
           Scaffold(
            backgroundColor: AppTheme.colors.background,
            body: Center(child: Text("ISHONCH DELIVERY",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary))),
           ),
           IgnorePointer(
            child: AnimationScreen(
              color: AppTheme.colors.primary
            )
          )
         ],
       ));
     },),
     ),
    );
  }
} 