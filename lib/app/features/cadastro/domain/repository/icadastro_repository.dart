import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/common/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class CadastroRepositoryImpl {
  Future<Either<Failure, UserCredential>> cadastro(UserModel user);
}
