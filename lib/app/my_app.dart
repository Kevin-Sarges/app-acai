import 'package:app_acai/app/common/utils/routes_app.dart';
import 'package:app_acai/app/features/login/presenter/screen/login_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Açaí do Boca',
      routes: {
        RoutesApp.initialRouter: (context) => const LoginScreen(),
        RoutesApp.home: (context) => Container(),
      },
    );
  }
}
