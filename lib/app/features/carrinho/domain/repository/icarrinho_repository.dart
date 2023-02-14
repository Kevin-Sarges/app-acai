import 'package:app_acai/app/common/entity/produto_carrinho_entity.dart';
import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/common/model/produto_carrinho_model.dart';
import 'package:dartz/dartz.dart';

abstract class CarrinhoRepositoryImpl {
  Future<Either<Failure, List<ProdutoCarrinhoEntity>>> getProdutoCarrinho();
  Future<Either<Failure, double>> somaPreco();
  Future<Either<Failure, void>> limparCarrinho();
  Future<Either<Failure, void>> onDeleteProduto(String id);
  Future<Either<Failure, int>> updateQtd(ProdutoCarrinhoModel produto);
}
