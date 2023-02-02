import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/common/model/produto_carrinho_model.dart';
import 'package:app_acai/app/features/produto/domain/repository/iproduto_repository.dart';
import 'package:dartz/dartz.dart';

class AddCarrinhoUseCase {
  final ProdutoRepositoryImpl repository;

  AddCarrinhoUseCase({required this.repository});

  Future<Either<Failure, void>> call(ProdutoCarrinhoModel product) async {
    return await repository.addProdutoCarrinho(product);
  }
}
