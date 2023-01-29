import 'package:app_acai/app/common/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class CadastroDataSourceImpl {
  Future<UserCredential> cadastroUsuario(UserModel user);
}
