import 'dart:developer';

import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';

class OtherLoginsWidget extends StatelessWidget {
  const OtherLoginsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Outras formas de login',
          style: TextStyle(
            color: ColorsApp.whitePrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                log('Facebook');
              },
              focusColor: ColorsApp.blackPrimary,
              child: Image.asset(
                'assets/images/facebook.png',
                width: 40,
                height: 40,
              ),
            ),
            InkWell(
              onTap: () {
                log('Google');
              },
              child: Image.asset(
                'assets/images/google.png',
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
