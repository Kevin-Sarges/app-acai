import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/common/model/user_model.dart';
import 'package:app_acai/app/features/login/domain/repository/ilogin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginEmailSenhaUseCase {
  final LoginRepositoryImpl repository;

  LoginEmailSenhaUseCase({required this.repository});

  Future<Either<Failure, UserCredential>> call(UserModel user) async {
    return await repository.signInEmailSenha(user);
  }
}
