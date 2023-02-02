import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/common/model/produto_carrinho_model.dart';
import 'package:app_acai/app/features/produto/domain/datasource/iproduto_datasource.dart';
import 'package:app_acai/app/features/produto/domain/repository/iproduto_repository.dart';
import 'package:dartz/dartz.dart';

class ProdutoRepository implements ProdutoRepositoryImpl {
  final ProdutoDataSourceImpl dataSource;

  ProdutoRepository({required this.dataSource});

  @override
  Future<Either<Failure, void>> addProdutoCarrinho(
      ProdutoCarrinhoModel product) async {
    try {
      final result = await dataSource.addProdutoCarrinho(product);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> onDelete(String id) async {
    try {
      final result = await dataSource.onDelete(id);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
