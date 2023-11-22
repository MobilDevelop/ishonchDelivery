
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/deliver/deliver_cubit.dart';
import 'package:kuryer/application/deliver/deliver_state.dart';
import 'package:kuryer/presentattion/assets/asset_index.dart';

class DeliverPage extends StatelessWidget {
  const DeliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DeliverCubit(),
     child: BlocListener<DeliverCubit,DeliverState>(listener: (_, state) {
       
     },
      child: Builder(builder: (context) {
        final cubit  = context.read<DeliverCubit>();
        return BlocBuilder<DeliverCubit,DeliverState>(builder: (context, state) => Scaffold(
          backgroundColor: AppTheme.colors.background,
          body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Container(
                    height: 80.h,
                    padding: EdgeInsets.only(bottom: ScreenSize.h10),
                    decoration: BoxDecoration(
                      color: AppTheme.colors.primary,
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Text("Topshiriq",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white))),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (_, index) => Container(
                      height: 150.h,
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h10),
                      decoration: BoxDecoration(
                        color: AppTheme.colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.colors.grey.withOpacity(.6),
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: Offset(7.w, 6.h)
                          )
                        ],
                        border: Border.all(
                          color: AppTheme.colors.secondary,
                          width: .6
                        ),
                        borderRadius: BorderRadius.circular(15.r)
                      ),
                    )
                    ))
              ]
            ),
          )
        ));
      },),
     ),
    );
  }
}