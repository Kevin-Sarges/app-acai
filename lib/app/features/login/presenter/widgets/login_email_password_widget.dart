import 'dart:developer';

import 'package:app_acai/app/common/model/user_model.dart';
import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/common/utils/routes_app.dart';
import 'package:app_acai/app/common/widgets/input_email_widget.dart';
import 'package:app_acai/app/common/widgets/input_password_widget.dart';
import 'package:app_acai/app/features/login/presenter/controllers/login_cubit.dart';
import 'package:app_acai/app/features/login/presenter/controllers/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginEmailSenhaWidget extends StatefulWidget {
  const LoginEmailSenhaWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginEmailSenhaWidget> createState() => _LoginEmailSenhaWidgetState();
}

class _LoginEmailSenhaWidgetState extends State<LoginEmailSenhaWidget> {
  final _formKey = GlobalKey<FormState>();
  final _textControllerEmail = TextEditingController();
  final _textControllerPassword = TextEditingController();

  final cubit = GetIt.I.get<LoginCubit>();

  bool isHiddenText = true;

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
          Form(
            key: _formKey,
            child: Column(
              children: [
                InputFormEmail(
                  textController: _textControllerEmail,
                  hintText: 'user@email.com',
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                InputFormPassword(
                  label: 'Senha',
                  obscureText: isHiddenText,
                  textController: _textControllerPassword,
                  keyboardType: TextInputType.visiblePassword,
                  onTap: () {
                    setState(() {
                      isHiddenText = !isHiddenText;
                    });
                  },
                  childIcon: Icon(
                    isHiddenText ? Icons.visibility : Icons.visibility_off,
                    color: ColorsApp.purpleSecondary,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  log('Esqueci minha senha');
                },
                child: const Text(
                  'Esqueci minha senha',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoutesApp.cadastro,
                  );
                },
                child: const Text(
                  'Cadastre-se',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  cubit.singInEmailSenha(
                    UserModel(
                      email: _textControllerEmail.text,
                      password: _textControllerPassword.text,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsApp.green,
              ),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
