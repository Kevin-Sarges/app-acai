import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/common/entity/produto_carrinho_entity.dart';
import 'package:app_acai/app/features/carrinho/domain/datasource/icarrinho_datasource.dart';
import 'package:app_acai/app/features/carrinho/domain/repository/icarrinho_repository.dart';
import 'package:dartz/dartz.dart';

class CarrinhoRepository implements CarrinhoRepositoryImpl {
  final CarrinhoDataSourceImpl dataSource;

  CarrinhoRepository({required this.dataSource});

  @override
  Future<Either<Failure, List<ProdutoCarrinhoEntity>>>
      getProdutoCarrinho() async {
    try {
      final result = await dataSource.getProdutoCarrinho();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> limparCarrinho() async {
    try {
      final result = await dataSource.limparCarrinho();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, double>> somaPreco() async {
    try {
      final result = await dataSource.somaPreco();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> onDeleteProduto(String id) async {
    try {
      final result = await dataSource.onDeleteProduto(id);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
