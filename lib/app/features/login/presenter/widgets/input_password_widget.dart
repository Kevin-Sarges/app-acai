import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';

class InputFormPassword extends StatelessWidget {
  const InputFormPassword({
    Key? key,
    required this.textController,
    required this.keyboardType,
    required this.label,
    required this.obscureText,
    required this.onTap,
    required this.childIcon,
  }) : super(key: key);

  final Widget label;
  final TextInputType keyboardType;
  final TextEditingController textController;
  final bool? obscureText;
  final VoidCallback onTap;
  final Widget childIcon;

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
      obscureText: obscureText ?? false,
      style: const TextStyle(
        color: ColorsApp.whiteSecondary,
      ),
      decoration: InputDecoration(
        label: label,
        labelStyle: const TextStyle(
          color: ColorsApp.whitePrimary,
        ),
        suffixIcon: InkWell(
          onTap: onTap,
          child: childIcon,
        ),
      ),
    );
  }
}
