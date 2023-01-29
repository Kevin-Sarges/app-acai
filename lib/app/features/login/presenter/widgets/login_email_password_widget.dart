import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/common/widgets/input_email_widget.dart';
import 'package:app_acai/app/common/widgets/input_password_widget.dart';
import 'package:flutter/material.dart';

class LoginEmailSenhaWidget extends StatefulWidget {
  const LoginEmailSenhaWidget({Key? key}) : super(key: key);

  @override
  State<LoginEmailSenhaWidget> createState() => _LoginEmailSenhaWidgetState();
}

class _LoginEmailSenhaWidgetState extends State<LoginEmailSenhaWidget> {
  final formKey = GlobalKey<FormState>();
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();
  bool isHiddenText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              InputFormEmail(
                textController: textControllerEmail,
                hintText: 'user@email.com',
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              InputFormPassword(
                label: 'Senha',
                obscureText: isHiddenText,
                textController: textControllerPassword,
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
              onPressed: () {},
              child: const Text(
                'Esqueci senha',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
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
            onPressed: () {},
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
