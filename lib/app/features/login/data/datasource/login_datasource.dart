import 'package:app_acai/app/common/error/common_errors.dart';
import 'package:app_acai/app/common/model/user_model.dart';
import 'package:app_acai/app/features/login/domain/datasource/ilogin_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginDataSource implements LoginDataSourceImpl {
  final firebaseAuth = FirebaseAuth.instance;
  final facebookAuth = FacebookAuth.instance;
  final googleSignIn = GoogleSignIn();

  @override
  Future<UserCredential> signInEmailSenha(UserModel user) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Nenhum usuário encontrado para esse e-mail.');
      } else if (e.code == 'wrong-password') {
        print('Senha incorreta fornecida para esse usuário.');
      }

      throw CommonDesconhecidoError(message: e.message);
    }
  }

  @override
  Future<UserCredential> signInFacebook() async {
    try {
      final loginResult = await facebookAuth.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(
        loginResult.accessToken!.token,
      );

      final credential =
          firebaseAuth.signInWithCredential(facebookAuthCredential);

      return credential;
    } on FirebaseAuthException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }

  @override
  Future<Object?> signInGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken,
      );

      User? firebaseUser =
          (await firebaseAuth.signInWithCredential(credential)).user;

      return firebaseUser;
    } on FirebaseAuthException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
