import 'package:app_acai/app/common/entity/produto_carrinho_entity.dart';
import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/carrinho/domain/repository/icarrinho_repository.dart';
import 'package:dartz/dartz.dart';

class GetProdutoCarrinhoUseCase {
  final CarrinhoRepositoryImpl repository;

  GetProdutoCarrinhoUseCase({required this.repository});

  Future<Either<Failure, List<ProdutoCarrinhoEntity>>> call() async {
    return await repository.getProdutoCarrinho();
  }
}
