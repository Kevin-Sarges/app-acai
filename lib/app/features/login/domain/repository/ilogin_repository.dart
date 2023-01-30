import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/common/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepositoryImpl {
  Future<Either<Failure, UserCredential>> signInEmailSenha(UserModel user);
  Future<Either<Failure, Object?>> signInGoogle();
  Future<Either<Failure, UserCredential>> signInFacebook();
}
