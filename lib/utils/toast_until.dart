import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ToastUntil{

  //写一个静态普通弹窗方法
  static commonToast(String msg){
    // 错误提示
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0)
    ;
  }
  // 错误弹窗

  // 成功弹窗

}