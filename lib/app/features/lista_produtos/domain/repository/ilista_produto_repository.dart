import 'package:app_acai/app/common/entity/produto_entity.dart';
import 'package:app_acai/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ListaProdutosRepositoryImpl {
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, List<ProdutoEntity>>> getProduto();
}
