import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/login/data/model/login_model.dart';
import 'package:app_acai/app/features/login/domain/repository/ilogin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginEmailSenhaUseCase {
  final LoginRepositoryImpl repository;

  LoginEmailSenhaUseCase({required this.repository});

  Future<Either<Failure, UserCredential>> call(LoginModel user) async {
    return await repository.signInEmailSenha(user);
  }
}
