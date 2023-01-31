import 'package:app_acai/app/features/splash/data/datasorce/splash_datasorce.dart';
import 'package:app_acai/app/features/splash/data/repository/splash_repository.dart';
import 'package:app_acai/app/features/splash/domain/datasorce/isplash_datasource.dart';
import 'package:app_acai/app/features/splash/domain/repository/isplash_repository.dart';
import 'package:app_acai/app/features/splash/domain/usecase/user_is_logger_usecase.dart';
import 'package:app_acai/app/features/splash/presenter/controllers/splash_cubit.dart';
import 'package:get_it/get_it.dart';

class SplashInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<SplashDataSourceImpl>(
      () => SplashDataSource(),
    );

    getIt.registerFactory<SplashRepositoryImpl>(
      () => SplashRepository(dataSource: getIt()),
    );

    getIt.registerFactory<UserIsLoggerInUseCase>(
      () => UserIsLoggerInUseCase(repository: getIt()),
    );

    getIt.registerFactory<SplashCubit>(
      () => SplashCubit(dataSource: getIt()),
    );
  }
}
