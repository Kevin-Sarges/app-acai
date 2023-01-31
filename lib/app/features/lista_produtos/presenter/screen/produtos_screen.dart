import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/common/utils/routes_app.dart';
import 'package:app_acai/app/features/lista_produtos/presenter/controllers/lista_produtos_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProdutosScreen extends StatefulWidget {
  const ProdutosScreen({Key? key}) : super(key: key);

  @override
  State<ProdutosScreen> createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen> {
  final cubit = GetIt.I.get<ListaProdutosCubit>();
  final user = FirebaseAuth.instance.currentUser!.photoURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsApp.whitePrimary,
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Row(
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
      ),
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
