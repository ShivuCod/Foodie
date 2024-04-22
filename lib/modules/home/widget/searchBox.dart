import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final VoidCallback onPressed; // Define a callback function

  const SearchBox({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              gapPadding: 1.0,
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Colors.transparent)),
          errorBorder: OutlineInputBorder(
              gapPadding: 1.0,
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              gapPadding: 1,
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Colors.transparent)),
          disabledBorder: OutlineInputBorder(
              gapPadding: 1,
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedErrorBorder: OutlineInputBorder(
              gapPadding: 1,
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Colors.transparent)),
          fillColor: Colors.grey.shade200,
          filled: true,
          suffixIcon: Icon(Icons.search,color: Colors.grey,)),
    );
  }
}
