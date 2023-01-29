import 'package:app_acai/app/features/cadastro/data/datasource/cadastro_datasource.dart';
import 'package:app_acai/app/features/cadastro/data/repository/cadastro_repository.dart';
import 'package:app_acai/app/features/cadastro/domain/datasource/icadastro_datasource.dart';
import 'package:app_acai/app/features/cadastro/domain/repository/icadastro_repository.dart';
import 'package:app_acai/app/features/cadastro/domain/usecase/cadastro_usecase.dart';
import 'package:app_acai/app/features/cadastro/presenter/controllers/cadastro_cubit.dart';
import 'package:get_it/get_it.dart';

class CadastroInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<CadastroDataSourceImpl>(
      () => CadastroDataSource(),
    );

    getIt.registerFactory<CadastroRepositoryImpl>(
      () => CadastroRepository(dataSource: getIt()),
    );

    getIt.registerFactory<CadastroUsecase>(
      () => CadastroUsecase(repository: getIt()),
    );

    getIt.registerFactory<CadastroCubit>(
      () => CadastroCubit(cadastroUsecase: getIt()),
    );
  }
}
