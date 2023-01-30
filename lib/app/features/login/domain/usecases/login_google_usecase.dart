import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/login/domain/repository/ilogin_repository.dart';
import 'package:dartz/dartz.dart';

class LoginGoogleUseCase {
  final LoginRepositoryImpl repository;

  LoginGoogleUseCase({required this.repository});

  Future<Either<Failure, Object?>> call() async {
    return await repository.signInGoogle();
  }
}
