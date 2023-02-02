import 'package:app_acai/app/common/model/produto_carrinho_model.dart';

abstract class ProdutoDataSourceImpl {
  Future<void> addProdutoCarrinho(ProdutoCarrinhoModel product);
  Future<void> onDelete(String id);
}
