import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart' show AppColor;
import 'package:flutter_os_china/pages/error_page.dart';
import 'package:flutter_os_china/pages/index/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_os_china/models/provider_model.dart';
import 'package:flutter_os_china/models/provider_other.dart';
void main() =>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // flutter团队开始慢慢移除ThemeData.primaryColor属性对所有组件的影响，
    // 取而代之的是基于ColorScheme的Color
    // 因为有的组件的默认颜色使用的是 primaryColor，有的用的是primarySwatch，所以必须同时设置
    return buildMultiProvider();
  }
  MultiProvider buildMultiProvider(){

    return  MultiProvider(
      providers: [
        Provider(create: (_) => MyModel()),
        Provider(create: (_) => OtherModel()),
       ],
        child:MaterialApp(
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
            onUnknownRoute: (RouteSettings setting){
              String? name=setting.name;
              print("没有匹配到路由");
              // MaterialPageRoute方法是动态路由
              return MaterialPageRoute(builder: (context)=>const ErrorPage());
            },
            home: const HomePage(),
            locale: const Locale('zh'),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              //此处
              Locale('zh', 'CH'),
              Locale('en', 'US'),
            ]
        ) ,
    );

  }
  // 单个Provider
  Provider<MyModel> buildProvider() {
    return Provider(
      create: (_){
          return   MyModel();
      },
      child:  MaterialApp(
      debugShowCheckedModeBanner: false,//去除右上角debug标签
      title: '开源中国',
      theme: ThemeData(
          primaryColor: AppColor.primaryColor ,
          dividerColor: AppColor.primaryColor,
          colorScheme: const ColorScheme.light().copyWith(primary: AppColor.primaryColor),
          primarySwatch: AppColor.primarySwatchColor,
          buttonTheme: const ButtonThemeData(
              buttonColor: AppColor.primaryColor,
              textTheme: ButtonTextTheme.normal
          )
      ),
      onUnknownRoute: (RouteSettings setting){
        String? name=setting.name;
        print("没有匹配到路由");
        // MaterialPageRoute方法是动态路由
        return MaterialPageRoute(builder: (context)=>const ErrorPage());
      },
      home: const HomePage(),
      locale: const Locale('zh'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        //此处
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ]
  ));
  }
}


// 动态路由直接使用 Navigator.push( context, MaterialPageRoute( builder: (context)=>route) 进行跳转
