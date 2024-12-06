import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double height;
  final String? fontFamily;
  final TextAlign textAlign; // Add textAlign property

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 24.0,
    this.fontWeight = FontWeight.w500,
    this.color = const Color(0xfff9B9496),
    this.height = 1.2,
    this.fontFamily,
    this.textAlign = TextAlign.start, 
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign, 
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        height: height,
        fontFamily: fontFamily,
      ),
    );
  }
}
