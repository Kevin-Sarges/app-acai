import 'package:app_acai/app/common/routes_app.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Açaí do Boca',
      routes: {
        RoutesApp.initialRouter: (context) => Container(),
        RoutesApp.login: (context) => Container(),
        RoutesApp.home: (context) => Container(),
      },
    );
  }
}
