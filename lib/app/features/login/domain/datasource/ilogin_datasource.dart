import 'package:app_acai/app/common/model/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDataSourceImpl {
  Future<UserCredential> signInEmailSenha(LoginModel user);
  Future<UserCredential> signInGoogle();
  Future<UserCredential> signInFacebook();
}
