import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/common/utils/routes_app.dart';
import 'package:app_acai/app/features/lista_produtos/presenter/controllers/lista_produtos_cubit.dart';
import 'package:app_acai/app/features/lista_produtos/presenter/controllers/lista_produtos_state.dart';
import 'package:app_acai/app/features/lista_produtos/presenter/widgets/lista_produtos_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProdutosScreen extends StatefulWidget {
  const ProdutosScreen({Key? key}) : super(key: key);

  @override
  State<ProdutosScreen> createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen> {
  final cubit = GetIt.I.get<ListaProdutosCubit>();
  final textController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!.photoURL;

  @override
  void initState() {
    super.initState();

    cubit.getProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsApp.whitePrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: ColorsApp.blackSecondary,
              backgroundImage: NetworkImage(
                user == null
                    ? 'https://cdn-icons-png.flaticon.com/512/3177/3177440.png'
                    : user!.toString(),
              ),
            ),
            IconButton(
              onPressed: () {
                cubit.userSignOut();

                Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutesApp.login,
                  (_) => true,
                );
              },
              icon: const Icon(
                Icons.logout,
                color: ColorsApp.blackSecondary,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 15,
            right: 8,
            left: 8,
            bottom: 0,
          ),
          child: BlocBuilder<ListaProdutosCubit, ListaProdutosState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is ListaProdutosCarregando) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsApp.purplePrimary,
                  ),
                );
              }

              if (state is ListaProdutosErro) {
                return Center(
                  child: Text(state.erro.errorMessage),
                );
              }

              if (state is ListaProdutosSucesso) {
                final data = state.produtos;

                return Column(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorsApp.lightGray,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: ColorsApp.purpleSecondary,
                          width: 0.6,
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          ),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Procurar produto',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListProductsWidget(data: data),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
