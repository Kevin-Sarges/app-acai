import 'package:app_acai/app/features/login/domain/inject/login_inject.dart';
import 'package:get_it/get_it.dart';

class InjectDependency {
  static void init() {
    final getIt = GetIt.instance;

    LoginInjectDependency.init(getIt);
  }
}
