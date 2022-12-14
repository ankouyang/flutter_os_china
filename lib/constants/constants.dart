// 定义一系列常量抽象类
import 'dart:ui';

import 'package:flutter/material.dart';


//主题颜色
abstract class AppColor{
  //应用主题色
  static const int _primaryColorValue  = 0xff63ca6c;
  static const Color primaryColor = Color(_primaryColorValue);
  static const MaterialColor primarySwatchColor = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: Color(0xFFD1E3F6),
      100: Color(0xFFA7C9ED),
      200: Color(0xFF7EB0E4),
      300: Color(0xFF5999DB),
      400: Color(0xFF3683D2),
      500: Color(_primaryColorValue),
      600: Color(0xFF1258A1),
      700: Color(0xFF0d4279),
      800: Color(0xFF092C50),
      900: Color(0xFF041628),
    },
  );

}
//应用信息
abstract class AppInfos{
  //客户ID
  static const String clientID = '6RDDKdVEZU2TyaPSw1Ky';
  //应用私钥
  static const String clientSecret = 'QubVwezEgk1RnyzFyVLw9YPTzFHPgRcp';
  // 应用回调地址
  static const String redirectUrl = 'https://ankouyang.club/';
}

//屏幕宽高
 class  AppPhysicalSize{
  double hcScreenWidth() {
    return window.physicalSize.width;
  }
  double hcScreenHeight(){
    return window.physicalSize.height;
  }
}


//接口API
abstract class AppUrls{
  // host地址
  static const String host = 'https://www.oschina.net';
  // OpenAPI 授权登录
  static const String oauth2Authorize = '$host/action/oauth2/authorize';
  // authorization_code 方式获取 AccessToken
  static const String oauth2Token = '$host/action/openapi/token';
  // 获取当前登录用户的账户信息
  static const String userInfo = '$host/action/openapi/user';
  // 获取用户详情接口
  static const String myInformation = '$host/action/openapi/my_information';
  // 更新头像
  static const String portraitUpdate = '$host/action/openapi/portrait_update';
  // 获取私信列表
  static const String messageList = '$host/action/openapi/message_list';
  // 获取新闻列表
  static const String newsList = '$host/action/openapi/news_list';
  // 获取资讯详情
  static const String newsDetail = '$host/action/openapi/news_detail';
  //获取动弹列表
  static const String tweetList = '$host/action/openapi/tweet_list';
  //获取动弹详情
  static const String tweetDetail = '$host/action/openapi/tweet_detail';
  //获取博客列表
  static const String blogList = '$host/action/openapi/blog_list';
  //博客详情
  static const String blogDetail = '$host/action/openapi/blog_detail';
  // 发布博客
  static const String blogPub = '$host/action/openapi/blog_pub';

  // 发帖
  static const String postPub = '$host/action/openapi/post_pub';

}
