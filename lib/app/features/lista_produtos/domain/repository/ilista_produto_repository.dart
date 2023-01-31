import 'package:app_acai/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ListaProdutosRepositoryImpl {
  Future<Either<Failure, void>> signOut();
}
