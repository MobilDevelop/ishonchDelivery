import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuryer/application/login/login_cubit.dart';
import 'package:kuryer/application/login/login_state.dart';
import 'package:kuryer/presentattion/components/animation_loading/loading.dart';
import 'package:kuryer/presentattion/pages/login/components/background.dart';
import 'package:kuryer/presentattion/pages/login/components/login_form.dart';
import 'package:kuryer/presentattion/routes/index_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginCubit(),
    child: BlocListener<LoginCubit,LoginState>(listener: (_, state) {
      if(state is LoginNextHome){
        context.go(Routes.home.path);
      }
    },
    child: Builder(builder: (context) {
      final cubit = context.read<LoginCubit>();
      return BlocBuilder<LoginCubit,LoginState>(builder: (context, state) => Scaffold(
        body: Stack(
          children: [
            const Background(),
            LoginForm(
              press: cubit.loginChekc, 
              loginController: cubit.userNameController, 
              passwordController: cubit.passwordController
              ),
               Visibility(
                visible: cubit.loading,
                child: const Loading())
          ],
        ),
      ));
    },),
    ),
    );
  }
}