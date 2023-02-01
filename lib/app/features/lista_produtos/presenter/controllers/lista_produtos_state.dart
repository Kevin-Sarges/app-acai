import 'package:app_acai/app/common/entity/produto_entity.dart';
import 'package:app_acai/app/common/error/failure.dart';

abstract class ListaProdutosState {}

class ListaProdutosIntial extends ListaProdutosState {}

class ListaProdutosCarregando extends ListaProdutosState {}

class ListaProdutosSignOut extends ListaProdutosState {}

class ListaProdutosSucesso extends ListaProdutosState {
  List<ProdutoEntity> produtos;

  ListaProdutosSucesso(this.produtos);
}

class ListaProdutosErro extends ListaProdutosState {
  Failure erro;

  ListaProdutosErro(this.erro);
}
