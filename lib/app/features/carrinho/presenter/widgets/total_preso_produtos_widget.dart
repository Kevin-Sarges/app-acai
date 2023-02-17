import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/features/carrinho/presenter/controller/carrinho_cubit.dart';
import 'package:app_acai/app/features/carrinho/presenter/controller/carrinho_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class TotalPrecosProdutosWidget extends StatefulWidget {
  const TotalPrecosProdutosWidget({Key? key}) : super(key: key);

  @override
  State<TotalPrecosProdutosWidget> createState() =>
      _TotalPrecosProdutosWidgetState();
}

class _TotalPrecosProdutosWidgetState extends State<TotalPrecosProdutosWidget> {
  final cubit = GetIt.I.get<CarrinhoCubit>();

  @override
  void initState() {
    super.initState();

    cubit.somaPrecoCarrinho();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarrinhoCubit, CarrinhoState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is CarrinhoCarregando) {
          return const CircularProgressIndicator(
            color: ColorsApp.purplePrimary,
          );
        }

        if (state is CarrinhoErro) {
          return Text(state.erro.errorMessage);
        }

        if (state is CarrinhoSomaProduto) {
          final t = state.preco;

          return Text(
            'R\$ ${t.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          );
        }

        return Container();
      },
    );
  }
}
