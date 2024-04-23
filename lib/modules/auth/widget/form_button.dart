import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering/utils/theme.dart';

class FormButton extends ConsumerWidget {
  const FormButton({super.key,required this.text,this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return ElevatedButton(style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 50),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
    ),onPressed: onPressed, child: Text(text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),));
  }
}
