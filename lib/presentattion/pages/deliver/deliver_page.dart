
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/deliver/deliver_cubit.dart';
import 'package:kuryer/application/deliver/deliver_state.dart';
import 'package:kuryer/presentattion/assets/theme/app_theme.dart';

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
          body: Center(
            child: Text("Deliver"),
          ),
        ));
      },),
     ),
    );
  }
}