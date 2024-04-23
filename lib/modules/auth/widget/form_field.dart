import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    this.label,
    this.hint,
    this.type,
    required this.controller,
    this.isObscure = false,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final TextInputType? type;
  final bool isObscure;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      keyboardType: type,
      cursorColor: Colors.red,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        hintText: hint,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill the form';
        }
        return null;
      },
    );
  }
}
