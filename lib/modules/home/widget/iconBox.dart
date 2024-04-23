import 'package:flutter/material.dart';
import 'package:food_ordering/utils/theme.dart';

class IconBox extends StatelessWidget {
  const IconBox({super.key,required this.iconData,this.currentTab=0});
  final IconData iconData;
  final int? currentTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color:cardColor),
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.all(15),
      child: Icon(iconData,color:currentTab==1?Colors.red: Colors.black45,size: 30),
    );
  }
}
