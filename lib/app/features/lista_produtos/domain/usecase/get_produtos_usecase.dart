import 'package:app_acai/app/common/entity/produto_entity.dart';
import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/lista_produtos/domain/repository/ilista_produto_repository.dart';
import 'package:dartz/dartz.dart';

class GetProdutosUseCase {
  final ListaProdutosRepositoryImpl repository;

  GetProdutosUseCase({required this.repository});

  Future<Either<Failure, List<ProdutoEntity>>> call() async {
    return await repository.getProduto();
  }
}
