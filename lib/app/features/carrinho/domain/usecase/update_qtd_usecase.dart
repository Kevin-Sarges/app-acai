import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/common/model/produto_carrinho_model.dart';
import 'package:app_acai/app/features/carrinho/domain/repository/icarrinho_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateQtdUseCase {
  final CarrinhoRepositoryImpl repository;

  UpdateQtdUseCase({required this.repository});

  Future<Either<Failure, int>> call(ProdutoCarrinhoModel produto) async {
    return await repository.updateQtd(produto);
  }
}
