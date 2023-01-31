import 'package:app_acai/app/features/lista_produtos/data/datasource/lista_produtos_datasource.dart';
import 'package:app_acai/app/features/lista_produtos/data/repository/lista_produtos_respository.dart';
import 'package:app_acai/app/features/lista_produtos/domain/datasource/ilista_produto_datasource.dart';
import 'package:app_acai/app/features/lista_produtos/domain/repository/ilista_produto_repository.dart';
import 'package:app_acai/app/features/lista_produtos/domain/usecase/user_sign_out_usecase.dart';
import 'package:app_acai/app/features/lista_produtos/presenter/controllers/lista_produtos_cubit.dart';
import 'package:get_it/get_it.dart';

class ListaProdutosInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<ListaProdutosDataSourceImpl>(
      () => ListaProdutosDataSource(),
    );

    getIt.registerFactory<ListaProdutosRepositoryImpl>(
      () => ListaProdutosRepository(dataSource: getIt()),
    );

    getIt.registerFactory<UserSignOutUseCase>(
      () => UserSignOutUseCase(repository: getIt()),
    );

    getIt.registerFactory<ListaProdutosCubit>(
      () => ListaProdutosCubit(userSignOutUseCase: getIt()),
    );
  }
}
