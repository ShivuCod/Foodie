import 'package:flutter/material.dart';

verticalBox(double h) => SizedBox(height: h);
horizontalBox(double w) => SizedBox(width: w);

showToast(String msg, context) =>
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Text(msg,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.black),),
      backgroundColor: Colors.white,

      width:200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      behavior: SnackBarBehavior.floating,
    ));
