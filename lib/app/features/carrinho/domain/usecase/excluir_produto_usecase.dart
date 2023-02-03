import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/carrinho/domain/repository/icarrinho_repository.dart';
import 'package:dartz/dartz.dart';

class ExcluirProdutoUseCase {
  final CarrinhoRepositoryImpl repository;

  ExcluirProdutoUseCase({required this.repository});

  Future<Either<Failure, void>> call(String id) async {
    return await repository.onDeleteProduto(id);
  }
}
