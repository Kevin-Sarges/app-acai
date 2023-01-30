import 'package:app_acai/app/common/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDataSourceImpl {
  Future<UserCredential> signInEmailSenha(UserModel user);
  Future<Object?> signInGoogle();
  Future<UserCredential> signInFacebook();
}
