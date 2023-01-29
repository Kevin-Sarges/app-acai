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

  final String hintText;
  final String label;
  final TextInputType keyboardType;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo esta vazio';
        }

        return null;
      },
      controller: textController,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: ColorsApp.purplePrimary,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsApp.whiteSecondary,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.5),
          borderSide: const BorderSide(
            color: ColorsApp.purplePrimary,
          ),
        ),
        label: Text(label),
        hintText: hintText,
        labelStyle: const TextStyle(
          fontSize: 16,
        ),
        hintStyle: const TextStyle(
          color: ColorsApp.purpleSecondary,
        ),
      ),
    );
  }
}
