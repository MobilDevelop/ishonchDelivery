

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/user/user_cubit.dart';
import 'package:kuryer/application/user/user_state.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => UserCubit(),
     child: BlocListener<UserCubit,UserState>(listener: (context, state) {
       
     },
     child: Builder(builder: (context) {
        final cubit = context.read<UserCubit>();
        return BlocBuilder<UserCubit,UserState>(builder: (context, state) => Scaffold(
          body: Center(child: Text("User"),),
        ));
     },),
     ),
    );
  }
}