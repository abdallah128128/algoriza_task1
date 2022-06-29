import 'dart:ui';

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
  final Color? cursorColor;
  final Color focusedBorderColor;
  final Color labelTextColor;

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
    this.cursorColor = Colors.grey,
    this.focusedBorderColor=Colors.teal,
    this.labelTextColor=Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isPassword,
      cursorColor: cursorColor,

      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
          borderSide: BorderSide(
            color: focusedBorderColor,
          ),
        ),

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
        labelStyle: TextStyle(color:labelTextColor,fontSize: 13),
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
