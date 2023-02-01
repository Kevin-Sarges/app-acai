import 'package:app_acai/app/common/entity/produto_entity.dart';

abstract class ListaProdutosDataSourceImpl {
  Future<void> signOut();
  Future<List<ProdutoEntity>> getProduto();
}
