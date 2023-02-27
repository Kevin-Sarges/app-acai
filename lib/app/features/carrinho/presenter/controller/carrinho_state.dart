// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_acai/app/common/entity/produto_carrinho_entity.dart';
import 'package:app_acai/app/common/error/failure.dart';

abstract class CarrinhoState {}

class CarrinhoIntial extends CarrinhoState {}

class CarrinhoCarregando extends CarrinhoState {}

class CarrinhoSomaProduto extends CarrinhoState {
  Stream<double> preco;

  CarrinhoSomaProduto(this.preco);
}

class CarrinhoVazio extends CarrinhoState {}

class CarrinhoSucesso extends CarrinhoState {
  List<ProdutoCarrinhoEntity> produto;

  CarrinhoSucesso(this.produto);
}

class CarrinhoErro extends CarrinhoState {
  Failure erro;

  CarrinhoErro(this.erro);
}
