import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? buttonColor;
  final double textFontSize;
  final double height;
  final double width;
  final double buttonBorder;


  const MyButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.textColor = Colors.white,
    this.buttonColor = Colors.teal,
    this.textFontSize = 15,
    this.height =48,
    this.width =double.infinity,
    this.buttonBorder=10,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.0,
      minWidth: width,
      height: height,
      color: buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(buttonBorder))),
      onPressed: () {
        onTap();
      },
      child: Text(
        text,

        style: TextStyle(
          color: textColor,
          fontSize:textFontSize,

        ),
      ),
    );
  }
}