import 'package:app_acai/app/common/entity/produto_entity.dart';
import 'package:app_acai/app/common/model/produto_carrinho_model.dart';
import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/common/widgets/icon_button_widget.dart';
import 'package:app_acai/app/features/produto/presenter/controller/produto_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProdutoScreen extends StatefulWidget {
  const ProdutoScreen({Key? key, required this.produto}) : super(key: key);

  final ProdutoEntity produto;

  @override
  State<ProdutoScreen> createState() => _ProdutoScreenState();
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  final cubit = GetIt.I.get<ProdutoCubit>();
  int qtd = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.nome),
        backgroundColor: ColorsApp.purplePrimary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.produto.imagem,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Descrição: ',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(widget.produto.descricao),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      'Valor: ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'R\$ ${widget.produto.preco}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButtonWidget(
                          icon: Icon(
                            Icons.remove,
                            color: qtd <= 0
                                ? ColorsApp.lightGray
                                : ColorsApp.purpleSecondary,
                          ),
                          onPressed: qtd <= 0
                              ? null
                              : () {
                                  setState(() {
                                    qtd--;
                                  });
                                },
                        ),
                        const SizedBox(width: 10),
                        Text(
                          qtd.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButtonWidget(
                          icon: Icon(
                            Icons.add,
                            color:
                                qtd >= 6 && widget.produto.nome == '1L de Açaí'
                                    ? ColorsApp.lightGray
                                    : ColorsApp.purpleSecondary,
                          ),
                          onPressed:
                              qtd >= 6 && widget.produto.nome == '1L de Açaí'
                                  ? null
                                  : () {
                                      setState(() {
                                        qtd++;
                                      });
                                    },
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: qtd <= 0
                          ? null
                          : () {
                              final snackBar = SnackBar(
                                content: const Text(
                                    'Produto adicionado ao carrinho !!'),
                                action: SnackBarAction(
                                  label: 'desfazer',
                                  onPressed: () {
                                    cubit.deleteProdutoCarrinhoUseCase(
                                      widget.produto.id,
                                    );
                                  },
                                ),
                              );

                              cubit.addProdutoCarrinho(
                                ProdutoCarrinhoModel(
                                  id: widget.produto.id,
                                  nome: widget.produto.nome,
                                  imagem: widget.produto.imagem,
                                  qtd: qtd,
                                  preco: widget.produto.preco,
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                snackBar,
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.green,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.shopping_cart,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Adicionar Carrinho',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
