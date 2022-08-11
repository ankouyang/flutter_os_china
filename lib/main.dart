import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart' show AppColor;
import 'package:flutter_os_china/pages/home_page.dart';
import 'package:flutter_os_china/pages/my_page.dart';
void main() =>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // flutter团队开始慢慢移除ThemeData.primaryColor属性对所有组件的影响，
    // 取而代之的是基于ColorScheme的Color
    // 因为有的组件的默认颜色使用的是 primaryColor，有的用的是primarySwatch，所以必须同时设置
    return MaterialApp(
        debugShowCheckedModeBanner: false,//去除右上角debug标签
        title: '开源中国',
        theme: ThemeData(
            primaryColor: AppColor.primaryColor ,
            colorScheme: const ColorScheme.light().copyWith(primary: AppColor.primaryColor),
            primarySwatch: AppColor.primarySwatchColor,
            buttonTheme: const ButtonThemeData(
              buttonColor: AppColor.primaryColor,
              textTheme: ButtonTextTheme.normal
            )
        ),
        routes: {
          '/my': (BuildContext context) => const MyPage()
        },
        home: HomePage()
    );
  }
}


