import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/login/domain/repository/ilogin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginFacebookUseCase {
  final LoginRepositoryImpl repository;

  LoginFacebookUseCase({required this.repository});

  Future<Either<Failure, UserCredential>> call() async {
    return await repository.signInFacebook();
  }
}
