import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';

class CarrinhoVazioWidget extends StatelessWidget {
  const CarrinhoVazioWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.remove_shopping_cart,
          size: 50,
          color: ColorsApp.purpleSecondary,
        ),
        SizedBox(height: 8),
        Text(
          'Carrinho vazio !!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorsApp.purpleSecondary,
          ),
        ),
      ],
    );
  }
}
