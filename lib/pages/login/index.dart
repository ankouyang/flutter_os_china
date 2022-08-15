import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_os_china/constants/constants.dart' show AppInfos,AppUrls;
import 'package:cupertino_icons/cupertino_icons.dart'; //加载中的iconwidget
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
