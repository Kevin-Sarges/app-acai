import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/common/model/produto_carrinho_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProdutoRepositoryImpl {
  Future<Either<Failure, void>> addProdutoCarrinho(
      ProdutoCarrinhoModel product);
  Future<Either<Failure, void>> onDelete(String id);
}
