import 'package:flutter/material.dart';

class FooterCardWidget extends StatelessWidget {
  const FooterCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text('Taxa total da compra: '),
            Text('R\$ 37,90'),
          ],
        ),
      ],
    );
  }
}
