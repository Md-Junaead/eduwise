import 'package:flutter/material.dart';

/// Reusable TextField with only bottom border (1px solid black).
class BottomBorderTextField extends StatelessWidget {
  const BottomBorderTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black54),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1), // 1px bottom
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        suffixIcon: suffixIcon,
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
