import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/features/login/presenter/widgets/login_email_password_widget.dart';
import 'package:app_acai/app/features/login/presenter/widgets/other_logins_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
              ),
              const LoginEmailSenhaWidget(),
              SizedBox(height: width * 0.1),
              const OtherLoginsWidget(),
              SizedBox(height: width * 0.1),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Contato',
                    style: TextStyle(
                      color: ColorsApp.whitePrimary,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/whatsapp.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '4002-8922',
                        style: TextStyle(
                          color: ColorsApp.whitePrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
