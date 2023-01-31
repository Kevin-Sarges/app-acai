import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/lista_produtos/domain/repository/ilista_produto_repository.dart';
import 'package:dartz/dartz.dart';

class UserSignOutUseCase {
  final ListaProdutosRepositoryImpl repository;

  UserSignOutUseCase({required this.repository});

  Future<Either<Failure, void>> call() async {
    return await repository.signOut();
  }
}
