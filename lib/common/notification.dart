// 定义一个通知类，要继承自Notification类
import 'package:flutter/material.dart';
class MyNotification extends Notification {
  final String msg;
  MyNotification(this.msg);
}