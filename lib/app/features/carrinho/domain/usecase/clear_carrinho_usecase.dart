import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/carrinho/domain/repository/icarrinho_repository.dart';
import 'package:dartz/dartz.dart';

class ClearCarrinhoUseCase {
  final CarrinhoRepositoryImpl repository;

  ClearCarrinhoUseCase({required this.repository});

  Future<Either<Failure, void>> call() async {
    return await repository.limparCarrinho();
  }
}
