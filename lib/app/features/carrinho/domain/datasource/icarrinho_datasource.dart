import 'package:app_acai/app/common/entity/produto_carrinho_entity.dart';

abstract class CarrinhoDataSourceImpl {
  Future<List<ProdutoCarrinhoEntity>> getProdutoCarrinho();
  Future<double> somaPreco();
  Future<void> limparCarrinho();
}
