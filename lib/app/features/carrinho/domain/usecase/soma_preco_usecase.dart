import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/carrinho/domain/repository/icarrinho_repository.dart';
import 'package:dartz/dartz.dart';

class SomaPrecoUseCase {
  final CarrinhoRepositoryImpl repository;

  SomaPrecoUseCase({required this.repository});

  Future<Either<Failure, double>> call() async {
    return await repository.somaPreco();
  }
}
