import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.color,
      required this.textstyle,
      required this.text});

  @override
  final Color color;
  final TextStyle textstyle;
  final String text;
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: color,
      child: Text(
        "$text",
        style: textstyle,
      ),
    );
  }
}
