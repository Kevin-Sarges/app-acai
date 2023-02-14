import 'package:app_acai/app/features/carrinho/data/datasource/carrinho_datasource.dart';
import 'package:app_acai/app/features/carrinho/data/repository/carrinho_repository.dart';
import 'package:app_acai/app/features/carrinho/domain/datasource/icarrinho_datasource.dart';
import 'package:app_acai/app/features/carrinho/domain/repository/icarrinho_repository.dart';
import 'package:app_acai/app/features/carrinho/domain/usecase/clear_carrinho_usecase.dart';
import 'package:app_acai/app/features/carrinho/domain/usecase/excluir_produto_usecase.dart';
import 'package:app_acai/app/features/carrinho/domain/usecase/get_produto_carrinho_usecase.dart';
import 'package:app_acai/app/features/carrinho/domain/usecase/soma_preco_usecase.dart';
import 'package:app_acai/app/features/carrinho/domain/usecase/update_qtd_usecase.dart';
import 'package:app_acai/app/features/carrinho/presenter/controller/carrinho_cubit.dart';
import 'package:get_it/get_it.dart';

class CarrinhoInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<CarrinhoDataSourceImpl>(
      () => CarrinhoDataSource(),
    );

    getIt.registerFactory<CarrinhoRepositoryImpl>(
      () => CarrinhoRepository(dataSource: getIt()),
    );

    getIt.registerFactory<ClearCarrinhoUseCase>(
      () => ClearCarrinhoUseCase(repository: getIt()),
    );

    getIt.registerFactory<GetProdutoCarrinhoUseCase>(
      () => GetProdutoCarrinhoUseCase(repository: getIt()),
    );

    getIt.registerFactory<SomaPrecoUseCase>(
      () => SomaPrecoUseCase(repository: getIt()),
    );

    getIt.registerFactory<ExcluirProdutoUseCase>(
      () => ExcluirProdutoUseCase(repository: getIt()),
    );

    getIt.registerFactory(
      () => UpdateQtdUseCase(repository: getIt()),
    );

    getIt.registerFactory(
      () => CarrinhoCubit(
        getProdutoCarrinhoUseCase: getIt(),
        excluirProdutoUseCase: getIt(),
        clearCarrinhoUseCase: getIt(),
        somaPrecoUseCase: getIt(),
        updateQtdUseCase: getIt(),
      ),
    );
  }
}
