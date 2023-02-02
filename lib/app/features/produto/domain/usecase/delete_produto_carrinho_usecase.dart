import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/produto/domain/repository/iproduto_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteProdutoCarrinhoUseCase {
  final ProdutoRepositoryImpl repository;

  DeleteProdutoCarrinhoUseCase({required this.repository});

  Future<Either<Failure, void>> call(String id) async {
    return await repository.onDelete(id);
  }
}
