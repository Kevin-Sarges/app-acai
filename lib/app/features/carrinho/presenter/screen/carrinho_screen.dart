import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/common/widgets/icon_button_widget.dart';
import 'package:app_acai/app/features/carrinho/presenter/controller/carrinho_cubit.dart';
import 'package:app_acai/app/features/carrinho/presenter/controller/carrinho_state.dart';
import 'package:app_acai/app/features/carrinho/presenter/widgets/carrinho_vazio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CarrinhoScreen extends StatefulWidget {
  const CarrinhoScreen({Key? key}) : super(key: key);

  @override
  State<CarrinhoScreen> createState() => _CarrinhoScreenState();
}

class _CarrinhoScreenState extends State<CarrinhoScreen> {
  final cubit = GetIt.I.get<CarrinhoCubit>();

  @override
  void initState() {
    super.initState();

    cubit.getProduto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsApp.whitePrimary,
        title: Row(
          children: const [
            Icon(
              Icons.shopping_cart,
              color: ColorsApp.blackSecondary,
            ),
            SizedBox(width: 10),
            Text(
              'Carrinho',
              style: TextStyle(
                fontSize: 22,
                color: ColorsApp.blackSecondary,
              ),
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                cubit.limparCarrinho();
              });
            },
            child: const Text(
              'Limpar carrinho',
              style: TextStyle(
                color: ColorsApp.purplePrimary,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<CarrinhoCubit, CarrinhoState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is CarrinhoCarregando) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsApp.purpleSecondary,
                ),
              );
            }

            if (state is CarrinhoErro) {
              return Center(
                child: Text(state.erro.errorMessage),
              );
            }

            if (state is CarrinhoVazio) {
              return const Center(
                child: CarrinhoVazioWidget(),
              );
            }

            if (state is CarrinhoSucesso) {
              final data = state.produto;

              if (data.isEmpty) {
                return const Center(
                  child: CarrinhoVazioWidget(),
                );
              }

              return Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(
                        top: 5,
                        left: 10,
                        right: 10,
                        bottom: 0,
                      ),
                      itemCount: state.produto.length,
                      itemBuilder: (context, index) {
                        final preco = data[index].preco;
                        final qtd = data[index].qtd;

                        final novoPreco = preco * qtd;

                        return Container(
                          padding: const EdgeInsets.only(bottom: 5, top: 12),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: ColorsApp.purplePrimary,
                                width: 1.5,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(99),
                                  image: DecorationImage(
                                    image: NetworkImage(data[index].imagem),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    data[index].nome,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsApp.purpleSecondary,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButtonWidget(
                                        icon: Icon(
                                          Icons.remove,
                                          color: qtd <= 1
                                              ? ColorsApp.lightGray
                                              : ColorsApp.purpleSecondary,
                                        ),
                                        onPressed: qtd <= 1
                                            ? null
                                            : () {
                                                setState(() {
                                                  data[index].qtd--;
                                                });
                                              },
                                      ),
                                      Text(
                                        '$qtd',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButtonWidget(
                                        icon: Icon(
                                          Icons.add,
                                          color: qtd >= 6 &&
                                                  data[index].nome ==
                                                      '1L de Açaí'
                                              ? ColorsApp.lightGray
                                              : ColorsApp.purpleSecondary,
                                        ),
                                        onPressed: qtd >= 6 &&
                                                data[index].nome == '1L de Açaí'
                                            ? null
                                            : () {
                                                setState(() {
                                                  data[index].qtd++;
                                                });
                                              },
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'R\$ ${novoPreco.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              IconButtonWidget(
                                icon: const Icon(
                                  Icons.delete,
                                  color: ColorsApp.red,
                                ),
                                onPressed: data.length <= 1
                                    ? () => cubit.limparCarrinho()
                                    : () => cubit.deleteProduto(data[index].id),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: ColorsApp.lightPurple,
                    ),
                  ),
                ],
              );
            }

            return Container(
              color: ColorsApp.purpleSecondary,
            );
          },
        ),
      ),
    );
  }
}
