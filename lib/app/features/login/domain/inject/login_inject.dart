import 'package:app_acai/app/features/login/data/datasource/login_datasource.dart';
import 'package:app_acai/app/features/login/data/repository/login_repository.dart';
import 'package:app_acai/app/features/login/domain/datasource/ilogin_datasource.dart';
import 'package:app_acai/app/features/login/domain/repository/ilogin_repository.dart';
import 'package:app_acai/app/features/login/domain/usecases/login_email_senha_usecase.dart';
import 'package:app_acai/app/features/login/domain/usecases/login_facebook_usecase.dart';
import 'package:app_acai/app/features/login/domain/usecases/login_google_usecase.dart';
import 'package:app_acai/app/features/login/presenter/controllers/login_cubit.dart';
import 'package:get_it/get_it.dart';

class LoginInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<LoginDataSourceImpl>(() => LoginDataSource());

    getIt.registerFactory<LoginRepositoryImpl>(
      () => LoginRepository(dataSource: getIt()),
    );

    getIt.registerFactory<LoginEmailSenhaUseCase>(
      () => LoginEmailSenhaUseCase(repository: getIt()),
    );

    getIt.registerFactory<LoginFacebookUseCase>(
      () => LoginFacebookUseCase(repository: getIt()),
    );

    getIt.registerFactory<LoginGoogleUseCase>(
      () => LoginGoogleUseCase(repository: getIt()),
    );

    getIt.registerFactory(
      () => LoginCubit(
        loginEmailSenha: getIt(),
        loginFacebook: getIt(),
        loginGoogle: getIt(),
      ),
    );
  }
}
