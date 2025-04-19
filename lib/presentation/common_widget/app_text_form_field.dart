import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.initialValue,
    this.hintText,
    this.icon,
    this.maxLines,
    this.onChanged,
    this.validator,
  });

  final String? initialValue;
  final String? hintText;
  final Widget? icon;
  final int? maxLines;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      minLines: 1,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        // MEMO(abe-tk): できればアイコンを上寄せにしたい
        icon: icon,
      ),
    );
  }
}
