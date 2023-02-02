import 'package:app_acai/app/features/produto/data/datasource/produto_datasource.dart';
import 'package:app_acai/app/features/produto/data/repository/produto_repository.dart';
import 'package:app_acai/app/features/produto/domain/datasource/iproduto_datasource.dart';
import 'package:app_acai/app/features/produto/domain/repository/iproduto_repository.dart';
import 'package:app_acai/app/features/produto/domain/usecase/add_carrinho_usecase.dart';
import 'package:app_acai/app/features/produto/domain/usecase/delete_produto_carrinho_usecase.dart';
import 'package:app_acai/app/features/produto/presenter/controller/produto_cubit.dart';
import 'package:get_it/get_it.dart';

class ProdutoInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<ProdutoDataSourceImpl>(
      () => ProdutoDataSource(),
    );

    getIt.registerFactory<ProdutoRepositoryImpl>(
      () => ProdutoRepository(dataSource: getIt()),
    );

    getIt.registerFactory<AddCarrinhoUseCase>(
      () => AddCarrinhoUseCase(repository: getIt()),
    );

    getIt.registerFactory<DeleteProdutoCarrinhoUseCase>(
      () => DeleteProdutoCarrinhoUseCase(repository: getIt()),
    );

    getIt.registerFactory<ProdutoCubit>(
      () => ProdutoCubit(
        addCarrinhoUseCase: getIt(),
        deleteProdutoCarrinhoUseCase: getIt(),
      ),
    );
  }
}
