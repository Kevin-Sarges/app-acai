import 'package:app_acai/app/common/model/produto_carrinho_model.dart';
import 'package:app_acai/app/features/produto/domain/usecase/add_carrinho_usecase.dart';
import 'package:app_acai/app/features/produto/domain/usecase/delete_produto_carrinho_usecase.dart';
import 'package:app_acai/app/features/produto/presenter/controller/produto_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProdutoCubit extends Cubit<ProdutoState> {
  ProdutoCubit({
    required this.addCarrinhoUseCase,
    required this.deleteProdutoCarrinhoUseCase,
  }) : super(ProdutoIntial());

  final AddCarrinhoUseCase addCarrinhoUseCase;
  final DeleteProdutoCarrinhoUseCase deleteProdutoCarrinhoUseCase;

  Future<void> addProdutoCarrinho(ProdutoCarrinhoModel produto) async {
    emit(ProdutoCarregando());

    final result = await addCarrinhoUseCase(produto);

    emit(result.fold(
      (erro) => ProdutoErro(erro),
      (_) => ProdutoSucesso(),
    ));
  }

  Future<void> onDeleteProdutoCarrinho(String id) async {
    emit(ProdutoCarregando());

    final result = await deleteProdutoCarrinhoUseCase(id);

    emit(result.fold(
      (erro) => ProdutoErro(erro),
      (r) => ProdutoSucesso(),
    ));
  }
}
