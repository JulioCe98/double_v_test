import 'package:flutter/material.dart';

import 'package:double_v_store/src/ui/styles/styles.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String hint;
  final String? initialValue;

  final bool? filled;
  final Color? filledColor;
  final Color? borderColor;
  final TextInputType? textInputType;
  final bool? autocorrect;
  final IconData icon;
  final Color? iconColor;
  final bool? obscureText;
  final bool? rounded;

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function()? onEditingComplete;

  const CustomTextFormFieldWidget(
      {Key? key,
      required this.title,
      required this.hint,
      required this.icon,
      this.textInputType = TextInputType.text,
      this.autocorrect = false,
      this.obscureText = false,
      this.validator,
      this.onChanged,
      this.onTap,
      this.filled,
      this.filledColor,
      this.borderColor,
      this.iconColor,
      this.initialValue,
      this.controller,
      this.onEditingComplete,
      this.rounded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        initialValue: initialValue,
        keyboardType: textInputType,
        autocorrect: autocorrect!,
        obscureText: obscureText!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: Styles.getInputDecorationStyle(
            label: title,
            hint: hint,
            icon: icon,
            iconColor: iconColor,
            fill: filled,
            filledColor: filledColor,
            borderColor: borderColor,
            rounded: rounded),
        validator: validator,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged);
  }
}
