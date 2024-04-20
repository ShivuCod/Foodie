import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final VoidCallback onPressed; // Define a callback function

  const SearchBox({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(decoration: InputDecoration(

    ),);
  }
}
