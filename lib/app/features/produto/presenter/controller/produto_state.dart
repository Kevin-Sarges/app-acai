import 'package:app_acai/app/common/error/failure.dart';

abstract class ProdutoState {}

class ProdutoIntial extends ProdutoState {}

class ProdutoCarregando extends ProdutoState {}

class ProdutoSucesso extends ProdutoState {}

class ProdutoErro extends ProdutoState {
  final Failure erro;

  ProdutoErro(this.erro);
}
