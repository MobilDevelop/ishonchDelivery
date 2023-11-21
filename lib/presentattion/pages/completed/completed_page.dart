
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/completed/completed_cubit.dart';
import 'package:kuryer/application/completed/completed_state.dart';

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
          body:  Center(
            child: Text("Completed"),
          ),
        ));
      },),
     ),
    );
  }
}