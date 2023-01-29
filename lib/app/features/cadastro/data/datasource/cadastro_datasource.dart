import 'package:app_acai/app/common/error/common_errors.dart';
import 'package:app_acai/app/common/model/user_model.dart';
import 'package:app_acai/app/features/cadastro/domain/datasource/icadastro_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroDataSource implements CadastroDataSourceImpl {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserCredential> cadastroUsuario(UserModel user) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      return credential;
    } on FirebaseException catch (e) {
      if (e.code == 'senha fraca') {
        print('A senha fornecida é muito fraca.');
      } else if (e.code == 'email já em uso') {
        print('A conta já existe para esse e-mail.');
      }

      throw CommonDesconhecidoError(message: e);
    }
  }
}
