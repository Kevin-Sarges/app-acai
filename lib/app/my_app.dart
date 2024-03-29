import 'package:app_acai/app/common/utils/routes_app.dart';
import 'package:app_acai/app/features/cadastro/presenter/screen/cadastro_screen_screen.dart';
import 'package:app_acai/app/features/home/presenter/screen/home_screen.dart';
import 'package:app_acai/app/features/login/presenter/screen/login_screen.dart';
import 'package:app_acai/app/features/splash/presenter/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Açaí do Boca',
      routes: {
        RoutesApp.initialRouter: (context) => const SplashScreen(),
        RoutesApp.login: (context) => const LoginScreen(),
        RoutesApp.home: (context) => const HomeScreen(),
        RoutesApp.cadastro: (context) => const CadastroScreen(),
      },
    );
  }
}
