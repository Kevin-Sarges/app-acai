import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/common/utils/routes_app.dart';
import 'package:app_acai/app/features/login/presenter/controllers/login_cubit.dart';
import 'package:app_acai/app/features/login/presenter/controllers/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class OtherLoginsWidget extends StatefulWidget {
  const OtherLoginsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OtherLoginsWidget> createState() => _OtherLoginsWidgetState();
}

class _OtherLoginsWidgetState extends State<OtherLoginsWidget> {
  final cubit = GetIt.I.get<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is LoginSucesso) {
          Navigator.pushNamed(context, RoutesApp.home);
          return;
        }
      },
      child: Column(
        children: [
          const Text(
            'Outras formas de login',
            style: TextStyle(
              color: ColorsApp.whitePrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  cubit.singInFacebook();
                },
                focusColor: ColorsApp.blackPrimary,
                child: Image.asset(
                  'assets/images/facebook.png',
                  width: 40,
                  height: 40,
                ),
              ),
              InkWell(
                onTap: () {
                  cubit.singInGoogle();
                },
                child: Image.asset(
                  'assets/images/google.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
