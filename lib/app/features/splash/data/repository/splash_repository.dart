import 'package:app_acai/app/common/error/failure.dart';
import 'package:app_acai/app/features/splash/domain/datasorce/isplash_datasource.dart';
import 'package:app_acai/app/features/splash/domain/repository/isplash_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

class SplashRepository implements SplashRepositoryImpl {
  final SplashDataSourceImpl dataSource;

  SplashRepository({required this.dataSource});

  @override
  Future<Either<Failure, User?>> isLoggerIn() async {
    try {
      final result = await dataSource.isLoggerIn();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
