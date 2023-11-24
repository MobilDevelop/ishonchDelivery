 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kuryer/application/completed/completed_cubit.dart';
import 'package:kuryer/application/completed/completed_state.dart';
import 'package:kuryer/presentattion/assets/res/screen_size.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CompletedCubit(),
     child: BlocListener<CompletedCubit,CompletedState>(listener: (_, state) {
       
     },
      child: Builder(builder: (context) {
        final cubit = context.read<CompletedCubit>();
        return BlocBuilder<CompletedCubit,CompletedState>(builder: (_, state) => Scaffold(
          body: Column(
            children: [
              Container(
                    height: 80.h,
                    padding: EdgeInsets.only(bottom: ScreenSize.h10),
                    decoration: BoxDecoration(
                      color: AppTheme.colors.primary,
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Text("Yakunlangan",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white))),
            ],
          )
        ));
      },),
     ),
    );
  }
}