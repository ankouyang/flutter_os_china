import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/cupertino.dart';
class CommonWeb extends StatefulWidget {
  final String title;
  final String url;
   const CommonWeb({Key? key, required this.title, required this.url}) :
         super(key: key);

  @override
  State<CommonWeb> createState() => _CommonWebState();
}

class _CommonWebState extends State<CommonWeb> {
  final FlutterWebviewPlugin _flutterWebviewPlugin = FlutterWebviewPlugin();
  bool isLoading = true;
  String? webUrl;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //监听Url变化
    _flutterWebviewPlugin.onUrlChanged.listen((url) {
      print('ScannerWeb:$url');

      //加载完毕之后关闭loading效果
      if(mounted){
        setState(() {
          isLoading = false;
        });
      }

    });

  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 插件的的关闭
    _flutterWebviewPlugin.close();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> appBarTitle =[
       Text(widget.title,style: const TextStyle(color: Color(0xffffffff)) ),
    ];
    if(isLoading){
      appBarTitle.add(const SizedBox(width: 10.0,));
      appBarTitle.add(const CupertinoActivityIndicator());
    }

    return  WebviewScaffold(
      url: widget.url,
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
