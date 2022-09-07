import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_os_china/utils/data_until.dart';
import 'package:flutter_os_china/utils/network_request.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_os_china/constants/constants.dart' show AppUrls;
class NewsDetailPage extends StatefulWidget {
  final String type;
  final String title;
  final int id;
  const NewsDetailPage({Key? key, required this.type, required this.id, required this.title}) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  final FlutterWebviewPlugin _flutterWebviewPlugin = FlutterWebviewPlugin();
  bool isLoading = true;
  String ? url;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 新闻详情
    getNewsDetail();
    _flutterWebviewPlugin.onUrlChanged.listen((url) {
      print('LoginPage:$url');
      //加载完毕之后关闭loading效果
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  getNewsDetail() {
    DataUntils.getAccessToken().then((accessToken){
      if(accessToken.isNotEmpty){
        Map<String,dynamic>  params = {
          'id':widget.id,
          'access_token':accessToken,
          'dataType':'json'
        };
       NetUtils.get(widget.type=='news'?AppUrls.newsDetail:AppUrls.blogDetail, params).then((data){
          if(data.isNotEmpty){
            Map<String,dynamic>  mapData = json.decode(data);
            setState(() {
              url = mapData['url'];
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> appBarTitle =[
        Text(
              widget.title,
             style:  TextStyle(color: Color(0xffffffff)),
           ),
    ];
    if(isLoading){
      appBarTitle.add(const SizedBox(width: 10.0,));
      appBarTitle.add(const CupertinoActivityIndicator());
    }
    return url ==null?  Scaffold(
      appBar: AppBar(
        title:  const Text('资讯详情'),
      ),
      body: const Center(
          child: CupertinoActivityIndicator()
      ),
    ) :WebviewScaffold(
        url: url!,
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
