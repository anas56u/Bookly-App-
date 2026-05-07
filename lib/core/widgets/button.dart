import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.textcolor,
    required this.backgroundcolor,
    this.borderradues,
    this.onPressed,
  });
  final String text;
  final Color textcolor;
  final Color backgroundcolor;
  final BorderRadius? borderradues;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundcolor,
        shape: RoundedRectangleBorder(
          borderRadius: borderradues ?? BorderRadius.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textcolor,
        ),
      ),
    );
  }
}
