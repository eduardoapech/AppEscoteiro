import 'package:flutter/material.dart';

class CsTextField extends StatelessWidget {
  const CsTextField({
    required this.label,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    super.key,
    required FocusNode focusNode,
    required TextStyle textStyle, required int minWidth,
  });

  final String label;
  final String hintText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.left,
      // style: TextStyle(color: _textColor),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        labelStyle: const TextStyle(fontSize: 18, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 3),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      ),
      obscureText: obscureText,
    );
  }
}
