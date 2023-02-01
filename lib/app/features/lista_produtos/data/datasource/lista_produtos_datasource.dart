import 'package:app_acai/app/common/entity/produto_entity.dart';
import 'package:app_acai/app/common/error/common_errors.dart';
import 'package:app_acai/app/common/model/produto_model.dart';
import 'package:app_acai/app/features/lista_produtos/domain/datasource/ilista_produto_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ListaProdutosDataSource implements ListaProdutosDataSourceImpl {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  @override
  Future<void> signOut() async {
    try {
      final result = await firebaseAuth.signOut();

      return result;
    } on FirebaseAuthException catch (e) {
      throw CommonDesconhecidoError(message: e);
    }
  }

  @override
  Future<List<ProdutoEntity>> getProduto() async {
    try {
      final getProdutos = await db.collection('produtos').get();

      final result = getProdutos.docs.map((doc) {
        final data = doc.data();

        return ProdutoModel(
          descricao: data['descricao'],
          nome: data['nome'],
          imagem: data['imagem'],
          preco: data['preco'],
        );
      }).toList();

      return result;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e);
    }
  }
}
