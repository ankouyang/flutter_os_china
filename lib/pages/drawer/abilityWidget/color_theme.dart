import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';
class ColorTheme extends StatefulWidget {
  const ColorTheme({Key? key}) : super(key: key);

  @override
  State<ColorTheme> createState() => _ColorThemeState();
}

class _ColorThemeState extends State<ColorTheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ColorTheme'),
        ),
        body: Text(
          '背景色亮度来决定',
          style: TextStyle(
            fontWeight: FontWeight.bold,
              //根据背景色亮度来确定Text颜色
            color: AppColor.primaryColor.computeLuminance()>0.5?Colors.white : Colors.black
          ),
        )
    );
  }
}
