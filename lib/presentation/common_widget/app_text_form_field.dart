import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.initialValue,
    this.controller,
    this.hintText,
    this.icon,
    this.maxLines,
    this.obscureText = false,
    this.obscureChange,
    this.onChanged,
    this.validator,
  });

  final String? initialValue;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? icon;
  final int? maxLines;
  final bool obscureText;
  final VoidCallback? obscureChange;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      minLines: 1,
      maxLines: obscureText ? 1 : maxLines,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        // MEMO(abe-tk): できればアイコンを上寄せにしたい
        icon: icon,
        suffixIcon:
            obscureChange == null
                ? null
                : IconButton(
                  onPressed: obscureChange,
                  icon:
                      obscureText
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                ),
      ),
    );
  }
}
