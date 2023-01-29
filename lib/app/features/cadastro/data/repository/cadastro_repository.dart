import 'package:app_acai/app/common/model/user_model.dart';
import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/cadastro/domain/datasource/icadastro_datasource.dart';
import 'package:app_acai/app/features/cadastro/domain/repository/icadastro_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

class CadastroRepository implements CadastroRepositoryImpl {
  final CadastroDataSourceImpl dataSource;

  CadastroRepository({required this.dataSource});

  @override
  Future<Either<Failure, UserCredential>> cadastro(UserModel user) async {
    try {
      final result = await dataSource.cadastroUsuario(user);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
