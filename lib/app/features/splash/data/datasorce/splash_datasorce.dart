import 'package:app_acai/app/common/error/common_errors.dart';
import 'package:app_acai/app/features/splash/domain/datasorce/isplash_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashDataSource implements SplashDataSourceImpl {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> isLoggerIn() async {
    try {
      final user = firebaseAuth.currentUser;

      return user;
    } on FirebaseAuthException catch (e) {
      throw CommonDesconhecidoError(message: e);
    }
  }
}
