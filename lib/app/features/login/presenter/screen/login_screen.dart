import 'dart:developer';

import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/features/login/presenter/widgets/input_email_widget.dart';
import 'package:app_acai/app/features/login/presenter/widgets/input_password_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _textControllerEmail = TextEditingController();
  final _textControllerPassword = TextEditingController();
  bool isHiddenText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(50),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/bkg_login.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputFormEmail(
                      textController: _textControllerEmail,
                      label: const Text('Email'),
                      hintText: 'user@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    InputFormPassword(
                      obscureText: isHiddenText,
                      textController: _textControllerPassword,
                      label: const Text('Senha'),
                      keyboardType: TextInputType.visiblePassword,
                      onTap: () {
                        log('Click !!');
                        setState(() {
                          isHiddenText = !isHiddenText;
                        });
                      },
                      childIcon: Icon(
                        isHiddenText ? Icons.visibility : Icons.visibility_off,
                        color: ColorsApp.whitePrimary,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
