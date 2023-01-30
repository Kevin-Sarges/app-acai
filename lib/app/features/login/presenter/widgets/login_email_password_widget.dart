import 'dart:developer';

import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/common/utils/routes_app.dart';
import 'package:app_acai/app/common/widgets/input_email_widget.dart';
import 'package:app_acai/app/common/widgets/input_password_widget.dart';
import 'package:flutter/material.dart';

class LoginEmailSenhaWidget extends StatefulWidget {
  const LoginEmailSenhaWidget({
    Key? key,
    required this.onPressed,
    required this.textControllerEmail,
    required this.textControllerPassword,
  }) : super(key: key);

  final VoidCallback onPressed;
  final TextEditingController textControllerEmail;
  final TextEditingController textControllerPassword;

  @override
  State<LoginEmailSenhaWidget> createState() => _LoginEmailSenhaWidgetState();
}

class _LoginEmailSenhaWidgetState extends State<LoginEmailSenhaWidget> {
  final _formKey = GlobalKey<FormState>();

  bool isHiddenText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              InputFormEmail(
                textController: widget.textControllerEmail,
                hintText: 'user@email.com',
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              InputFormPassword(
                label: 'Senha',
                obscureText: isHiddenText,
                textController: widget.textControllerPassword,
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
                widget.onPressed;
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
    );
  }
}
