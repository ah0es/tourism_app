import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon; // Add suffixIcon parameter

  const CustomTextfield({
    super.key,
    required this.hintText,
    this.inputType = TextInputType.text,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon, // Include suffixIcon in constructor
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xff9B9496),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xff9B9496),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xff9B9496),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xff9B9496),
          ),
        ),
        suffixIcon: suffixIcon, 
      ),
    );
  }
}
