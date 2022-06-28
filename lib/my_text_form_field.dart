import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final String emptyText;
  final Widget? preFix;
  final IconData? suffix;
  final VoidCallback? suffixPressed;
  final String? Function(String?)? validate;
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String validation;
  final Color? suffixColor;

  MyTextFormField({
    Key? key,
    required this.labelText,
    required this.emptyText,
    required this.hintText,
    this.preFix,
    required this.controller,
    required this.keyboardType,
    this.validate,
    this.suffix,
    this.suffixPressed,
    this.isPassword = false,
    required this.validation,
    this.suffixColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed!,
                icon: Icon(
                  suffix,
                  color: suffixColor,
                ),
              )
            : null,
        prefixIcon: preFix,
        hintText: hintText,
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      validator: (String? s) {
        if (s!.isEmpty) {
          return validation;
        } else {
          return null;
        }
      },
    );
  }
}
