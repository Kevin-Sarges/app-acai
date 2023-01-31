import 'package:app_acai/app/common/error/common_errors.dart';
import 'package:app_acai/app/features/lista_produtos/domain/datasource/ilista_produto_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ListaProdutosDataSource implements ListaProdutosDataSourceImpl {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signOut() async {
    try {
      final result = await firebaseAuth.signOut();

      return result;
    } on FirebaseAuthException catch (e) {
      throw CommonDesconhecidoError(message: e);
    }
  }
}
