import 'package:flutter/material.dart';

class NavigationIconView {
  //BottomNavigationBar的items 是BottomNavigationBarItem
  final  BottomNavigationBarItem item;
  // label
  final String label;
  //icon path
  final String iconPath;
  // actived icon path
  final String activeIconPath;

   // NavigationIconView 语法糖 构造器内初始化,一些变量可以初始化列表初始化,例如item
  NavigationIconView({  required this.label,required this.iconPath,required this.activeIconPath})
      : item =  BottomNavigationBarItem(
        label: label,
        icon: Image.asset(iconPath,width:20.0,height: 20.0),
        activeIcon: Image.asset(activeIconPath,width:20.0,height: 20.0),

  );

}