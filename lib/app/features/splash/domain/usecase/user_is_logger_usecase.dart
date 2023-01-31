import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/splash/domain/repository/isplash_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserIsLoggerInUseCase {
  final SplashRepositoryImpl repository;

  UserIsLoggerInUseCase({required this.repository});

  Future<Either<Failure, User?>> call() async {
    return await repository.isLoggerIn();
  }
}
