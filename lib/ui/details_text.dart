import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final double size;

  const DetailsText(
      {Key? key, required this.text, required this.weight, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xFF284065),
        fontWeight: weight,
        fontSize: size,
        fontFamily: 'Poppins',
      ),
    );
  }
}
