import 'package:app_acai/app/common/entity/produto_entity.dart';
import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/lista_produtos/domain/datasource/ilista_produto_datasource.dart';
import 'package:app_acai/app/features/lista_produtos/domain/repository/ilista_produto_repository.dart';
import 'package:dartz/dartz.dart';

class ListaProdutosRepository implements ListaProdutosRepositoryImpl {
  final ListaProdutosDataSourceImpl dataSource;

  ListaProdutosRepository({required this.dataSource});

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final result = await dataSource.signOut();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<ProdutoEntity>>> getProduto() async {
    try {
      final result = await dataSource.getProduto();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
