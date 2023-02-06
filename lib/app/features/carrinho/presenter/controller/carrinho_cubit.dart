import 'package:app_acai/app/features/carrinho/domain/usecase/clear_carrinho_usecase.dart';
import 'package:app_acai/app/features/carrinho/domain/usecase/excluir_produto_usecase.dart';
import 'package:app_acai/app/features/carrinho/domain/usecase/get_produto_carrinho_usecase.dart';
import 'package:app_acai/app/features/carrinho/domain/usecase/soma_preco_usecase.dart';
import 'package:app_acai/app/features/carrinho/presenter/controller/carrinho_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarrinhoCubit extends Cubit<CarrinhoState> {
  CarrinhoCubit({
    required this.getProdutoCarrinhoUseCase,
    required this.excluirProdutoUseCase,
    required this.clearCarrinhoUseCase,
    required this.somaPrecoUseCase,
  }) : super(CarrinhoIntial());

  final GetProdutoCarrinhoUseCase getProdutoCarrinhoUseCase;
  final ExcluirProdutoUseCase excluirProdutoUseCase;
  final ClearCarrinhoUseCase clearCarrinhoUseCase;
  final SomaPrecoUseCase somaPrecoUseCase;

  Future<void> getProduto() async {
    emit(CarrinhoCarregando());

    final result = await getProdutoCarrinhoUseCase();

    emit(result.fold(
      (erro) => CarrinhoErro(erro),
      (sucesso) => CarrinhoSucesso(sucesso),
    ));
  }

  Future<void> somaPrecoCarrinho() async {
    emit(CarrinhoCarregando());

    final result = await somaPrecoUseCase();

    emit(result.fold(
      (erro) => CarrinhoErro(erro),
      (sucesso) => CarrinhoSomaProduto(sucesso),
    ));
  }

  Future<void> deleteProduto(String id) async {
    await excluirProdutoUseCase(id);

    await getProduto();
  }

  Future<void> limparCarrinho() async {
    emit(CarrinhoCarregando());

    final result = await clearCarrinhoUseCase();

    emit(result.fold(
      (erro) => CarrinhoErro(erro),
      (_) => CarrinhoVazio(),
    ));
  }
}
