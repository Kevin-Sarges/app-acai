import 'package:app_acai/app/features/carrinho/domain/usecase/clear_carrinho_usecase.dart';
import 'package:app_acai/app/features/carrinho/domain/usecase/get_produto_carrinho_usecase.dart';
import 'package:app_acai/app/features/carrinho/domain/usecase/soma_preco_usecase.dart';
import 'package:app_acai/app/features/carrinho/presenter/controller/carrinho_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarrinhoCubit extends Cubit<CarrinhoState> {
  CarrinhoCubit({
    required this.getProdutoCarrinhoUseCase,
    required this.clearCarrinhoUseCase,
    required this.somaPrecoUseCase,
  }) : super(CarrinhoIntial());

  final GetProdutoCarrinhoUseCase getProdutoCarrinhoUseCase;
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

  Future<void> limparCarrinho() async {
    emit(CarrinhoCarregando());

    final result = await clearCarrinhoUseCase();

    emit(result.fold(
      (erro) => CarrinhoErro(erro),
      (_) => CarrinhoLimpo(),
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
}
