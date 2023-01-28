import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';

class InputFormEmail extends StatelessWidget {
  const InputFormEmail({
    Key? key,
    required this.textController,
    required this.keyboardType,
    required this.hintText,
    required this.label,
  }) : super(key: key);

  final Widget label;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsApp.whitePrimary,
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Campo esta vazio';
          }

          return null;
        },
        controller: textController,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: ColorsApp.whiteSecondary,
        ),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorsApp.whitePrimary,
              style: BorderStyle.solid,
            ),
          ),
          label: label,
          hintText: hintText,
          labelStyle: const TextStyle(
            color: ColorsApp.whitePrimary,
          ),
          hintStyle: const TextStyle(
            color: ColorsApp.lightGray,
          ),
        ),
      ),
    );
  }
}
