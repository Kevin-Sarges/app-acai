import 'package:app_acai/app/common/utils/routes_app.dart';
import 'package:app_acai/app/features/splash/domain/datasorce/isplash_datasource.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final cubit = GetIt.I.get<SplashDataSourceImpl>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkSignedIn(context);
    });
  }

  void checkSignedIn(BuildContext ctx) async {
    final user = await cubit.isLoggerIn();

    if (user != null) {
      Navigator.pushNamed(context, RoutesApp.home);
    } else {
      Navigator.pushNamed(context, RoutesApp.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/bkg_login.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
