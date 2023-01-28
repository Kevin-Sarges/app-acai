import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/login/data/model/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepositoryImpl {
  Future<Either<Failure, UserCredential>> signInEmailSenha(LoginModel user);
  Future<Either<Failure, UserCredential>> signInGoogle();
  Future<Either<Failure, UserCredential>> signInFacebook();
}
