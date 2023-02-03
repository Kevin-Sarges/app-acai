import 'package:app_acai/app/common/entity/produto_entity.dart';
import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:app_acai/app/features/produto/presenter/screen/produto_screen.dart';
import 'package:flutter/material.dart';

class ListProductsWidget extends StatelessWidget {
  const ListProductsWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<ProdutoEntity> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdutoScreen(
                  produto: data[index],
                ),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 13, bottom: 5),
            decoration: const BoxDecoration(
              color: ColorsApp.whitePrimary,
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
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    image: DecorationImage(
                      image: NetworkImage(data[index].imagem),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[index].nome,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.purpleSecondary,
                      ),
                    ),
                    Text(
                      'R\$ ${data[index].preco.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        );
      },
    );
  }
}
