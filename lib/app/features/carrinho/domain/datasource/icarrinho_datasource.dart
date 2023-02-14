import 'package:app_acai/app/common/entity/produto_carrinho_entity.dart';
import 'package:app_acai/app/common/model/produto_carrinho_model.dart';

abstract class CarrinhoDataSourceImpl {
  Future<List<ProdutoCarrinhoEntity>> getProdutoCarrinho();
  Future<double> somaPreco();
  Future<void> limparCarrinho();
  Future<void> onDeleteProduto(String id);
  Future<int> updateQtd(ProdutoCarrinhoModel produto);
}
