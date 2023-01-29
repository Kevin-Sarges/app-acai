import 'package:app_acai/app/common/model/user_model.dart';
import 'package:app_acai/app/features/login/domain/datasource/ilogin_datasource.dart';
import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/login/domain/repository/ilogin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository implements LoginRepositoryImpl {
  final LoginDataSourceImpl dataSource;

  LoginRepository({required this.dataSource});

  @override
  Future<Either<Failure, UserCredential>> signInEmailSenha(
      UserModel user) async {
    try {
      final result = await dataSource.signInEmailSenha(user);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInFacebook() async {
    try {
      final result = await dataSource.signInFacebook();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInGoogle() async {
    try {
      final result = await dataSource.signInGoogle();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
