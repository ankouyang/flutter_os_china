import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';

class HttpClientWidget extends StatefulWidget {
  const HttpClientWidget({Key? key}) : super(key: key);

  @override
  State<HttpClientWidget> createState() => _HttpClientWidgetState();
}

class _HttpClientWidgetState extends State<HttpClientWidget> {
   String  _text ='';
  void _getBaidu() async {
    try {
      // 1. 创建httpClient
      HttpClient httpClient = HttpClient();
      // 2. 打开http连接,设置请求头
      HttpClientRequest request = await httpClient.getUrl(Uri.parse("https://www.baidu.com"));
      // 3. 通过HttpClientRequest可以设置请求header
      request.headers.add(
        "user-agent",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1",
      );
      // 4. 等待连接服务器
      HttpClientResponse response = await request.close();
      // 5. 读取响应内容
      String responseBody = await response.transform(utf8.decoder).join();

      setState(() {
        _text = responseBody;
      });
      // 6. 请求结束,关闭httpClient
      httpClient.close();

      print(responseBody);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('httpClient'),
        ),
        body: Text(_text.replaceAll(RegExp(r"\s"), "")),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            _getBaidu();
          },
          backgroundColor: AppColor.primaryColor,
          child: const Icon(Icons.ice_skating),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
