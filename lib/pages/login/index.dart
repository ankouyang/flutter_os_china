import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_os_china/constants/constants.dart' show AppInfos,AppUrls;
import 'package:flutter_os_china/utils/network_request.dart';
import 'package:flutter_os_china/utils/data_until.dart';


//这里需要引入一个flutter_webview_plugin插件

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FlutterWebviewPlugin _flutterWebviewPlugin = FlutterWebviewPlugin();
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //监听Url变化
    _flutterWebviewPlugin.onUrlChanged.listen((url) {
      print('LoginPage:$url');
      //加载完毕之后关闭loading效果
      if(mounted){
        setState(() {
          isLoading = false;
        });
      }
      //开源中国登陆授权后，会把code拼接携带在回调地址后面 例如:https://ankouyang.club/?code=vpCKU6&state=
      if(url.isNotEmpty&&url.contains('?code=')){
        //登陆成功,提取code
        String code = url.split('?')[1].split('&')[0].split('=')[1];
        //通过code
        Map<String,dynamic> params = {
          'client_id': AppInfos.clientID,
          'client_secret': AppInfos.clientSecret,
          'grant_type': 'authorization_code',
          'redirect_uri': AppInfos.redirectUrl,
          'code': code,
          'dataType': 'json',
        };

        // 获取token  {"access_token":"8f56afac-affa-41d1-840f-dc1123c4c5a6","refresh_token":"723c5ea1-95ed-4552-866f-a94caf129019","uid":3007924,"token_type":"bearer","expires_in":604735}
        NetUtils.get(AppUrls.oauth2Token, params).then((data){
           print(data);
           // 这里需要用到 dart:convert  进行json解析
          Map<String,dynamic> mapData  = json.decode(data);
          if(mapData.isNotEmpty){
            // 保存token信息，这里可以写一个类 用shared_preferences第三方包来存储
            print(mapData);
            DataUntils.saveLoginInfo(mapData);
            // 返回上一页,并返回上一个页面并通知刷新数据
            Navigator.pop(context,'refresh');
          }

        });



      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _flutterWebviewPlugin.close();
  }

  //这里需要一个webView去承载登陆页面,获取授权
  @override
  Widget build(BuildContext context) {
    //response_type=code&client_id=s6BhdRkqt3&state=xyz&redirect_uri=https%3A%2F%2Fclient%2Eexample%2Ecom%2Fcb

    List<Widget> appBarTitle =[
      const Text('登陆开源中国',style: TextStyle(color: Color(0xffffffff)) ),
    ];
    if(isLoading){
      appBarTitle.add(const SizedBox(width: 10.0,));
      appBarTitle.add(const CupertinoActivityIndicator());
    }


    return  WebviewScaffold(
        url: '${AppUrls.oauth2Authorize}?response_type=code&client_id=${AppInfos.clientID}&redirect_uri=${AppInfos.redirectUrl}',
        appBar: AppBar(
            // title是一个widget
           title: Row(
             children:  appBarTitle,
           ) ,
        ),
        withJavascript: true,//允许执行js
        withLocalStorage: true,//允许本地存储
        withZoom: true//允许网页缩放
    );
  }
}
