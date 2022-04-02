import 'package:flutter/material.dart';

class Styles {
  static InputDecoration getInputDecorationStyle(
      {required String label,
      required hint,
      required IconData icon,
      Color? iconColor,
      bool? fill,
      Color? filledColor,
      Color? borderColor,
      bool? rounded}) {
    return InputDecoration(
        filled: fill ?? false,
        fillColor: filledColor,
        errorMaxLines: 2,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black, fontSize: 17.0),
        prefixIcon: Icon(
          icon,
          color: iconColor ?? Colors.blue,
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black45),
        enabledBorder: rounded != null && rounded
            ? const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(50)))
            : const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: rounded != null && rounded
            ? OutlineInputBorder(
                borderSide: BorderSide(color: borderColor ?? Colors.blue, width: 2.0), borderRadius: const BorderRadius.all(Radius.circular(50)))
            : UnderlineInputBorder(borderSide: BorderSide(color: borderColor ?? Colors.blue, width: 2.0)));
  }
}
