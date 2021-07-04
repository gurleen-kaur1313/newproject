import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegularText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const RegularText(
      {Key? key, required this.text, required this.color, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(fontSize: size, color: color),
    );
  }
}

class BoldText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const BoldText(
      {Key? key, required this.text, required this.color, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: size, color: color, fontWeight: FontWeight.bold),
    );
  }
}

class WeightText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;

  const WeightText(
      {Key? key,
      required this.text,
      required this.color,
      required this.size,
      required this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: size,
          color: color,
          fontWeight: weight,
          shadows: [Shadow(blurRadius: 1.5)]),
    );
  }
}
