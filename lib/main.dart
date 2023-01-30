import 'package:app_acai/app/common/inject/inject_dependecy.dart';
import 'package:app_acai/app/my_app.dart';
import 'package:app_acai/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  InjectDependency.init();
  runApp(const MyApp());
}
