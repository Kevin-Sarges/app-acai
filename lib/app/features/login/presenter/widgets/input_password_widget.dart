import 'package:app_acai/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';

class InputFormPassword extends StatelessWidget {
  const InputFormPassword({
    Key? key,
    required this.textController,
    required this.keyboardType,
    required this.obscureText,
    required this.onTap,
    required this.childIcon,
    required this.label,
  }) : super(key: key);

  final String label;
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
        color: ColorsApp.purpleSecondary,
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
        border: const OutlineInputBorder(),
        labelStyle: const TextStyle(
          fontSize: 16,
        ),
        suffixIcon: InkWell(
          onTap: onTap,
          child: childIcon,
        ),
      ),
    );
  }
}
